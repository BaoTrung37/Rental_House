import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
}

typedef OnOverScroll = Function(
    RefreshIndicatorMode? mode, double? distance, double limit);

class RefreshView extends StatefulWidget {
  const RefreshView({
    required this.child,
    required this.onRefresh,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
    this.color,
    this.needTopPadding = false,
    this.onOverScroll,
    this.iconSize = 27,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final RefreshCallback onRefresh;
  final ScrollNotificationPredicate notificationPredicate;
  final RefreshIndicatorTriggerMode triggerMode;
  final Color? color;
  final bool needTopPadding;
  final OnOverScroll? onOverScroll;

  final int iconSize;
  @override
  RefreshIndicatorState createState() => RefreshIndicatorState();
}

class RefreshIndicatorState extends State<RefreshView>
    with TickerProviderStateMixin<RefreshView> {
  late AnimationController _positionController;
  late AnimationController _scaleController;
  late Animation<double> _positionFactor;
  late Animation<double> _scaleFactor;

  RefreshIndicatorMode? _mode;

  bool? _isIndicatorAtTop;
  double? _internalDragOffset;

  double? get _dragOffset => _internalDragOffset;

  set _dragOffset(double? newValue) {
    _internalDragOffset = newValue;
    widget.onOverScroll?.call(_mode, newValue, _triggerLimit);
  }

  late final double _kDragSizeFactorLimit = 1.5;
  late final double _kDragContainerExtentPercentage = 0.25;
  late final Duration _kIndicatorScaleDuration =
      const Duration(milliseconds: 200);
  late final Duration _kIndicatorSnapDuration =
      const Duration(milliseconds: 150);

  late final Animatable<double> _kDragSizeFactorLimitTween =
      Tween<double>(begin: 0, end: _kDragSizeFactorLimit);
  late final Animatable<double> _oneToZeroTween =
      Tween<double>(begin: 1, end: 0);

  final _displacement = 20.0;
  final _triggerLimit = 80.0;

  late final _color = widget.color ?? Colors.white;

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  bool _shouldStart(ScrollNotification notification) {
    return ((notification is ScrollStartNotification &&
                notification.dragDetails != null) ||
            (notification is ScrollUpdateNotification &&
                notification.dragDetails != null &&
                widget.triggerMode == RefreshIndicatorTriggerMode.anywhere)) &&
        ((notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter == 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore == 0.0)) &&
        _mode == null &&
        _start(notification.metrics.axisDirection);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    if (_shouldStart(notification)) {
      setState(() {
        _mode = RefreshIndicatorMode.drag;
      });
      return false;
    }
    bool? indicatorAtTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
      case AxisDirection.up:
        indicatorAtTopNow = true;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        indicatorAtTopNow = null;
        break;
    }
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed) {
        _dismiss(RefreshIndicatorMode.canceled);
      }
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed) {
        if ((notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore > 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter > 0.0)) {
          _dismiss(RefreshIndicatorMode.canceled);
        } else {
          if (notification.metrics.axisDirection == AxisDirection.down) {
            _dragOffset = _dragOffset! - notification.scrollDelta!;
          } else if (notification.metrics.axisDirection == AxisDirection.up) {
            _dragOffset = _dragOffset! + notification.scrollDelta!;
          }
          _checkDragOffset(notification.metrics.viewportDimension);
        }
      }
      if (_mode == RefreshIndicatorMode.armed &&
          notification.dragDetails == null) {
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == RefreshIndicatorMode.drag ||
          _mode == RefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.overscroll;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.overscroll;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_mode) {
        case RefreshIndicatorMode.armed:
          _show();
          break;
        case RefreshIndicatorMode.drag:
          _dismiss(RefreshIndicatorMode.canceled);
          break;
        case RefreshIndicatorMode.canceled:
        case RefreshIndicatorMode.done:
        case RefreshIndicatorMode.refresh:
        case RefreshIndicatorMode.snap:
        case null:
          break;
      }
    }
    return false;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) {
      return false;
    }
    if (_mode == RefreshIndicatorMode.drag) {
      notification.disallowIndicator();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_mode == null);
    assert(_isIndicatorAtTop == null);
    assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
      case AxisDirection.up:
        _isIndicatorAtTop = true;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == RefreshIndicatorMode.drag ||
        _mode == RefreshIndicatorMode.armed);
    var newValue =
        _dragOffset! / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == RefreshIndicatorMode.armed) {
      newValue = max(newValue, 1.0 / _kDragSizeFactorLimit);
    }

    _positionController.value = newValue.clamp(0.0, 1);

    if (_mode == RefreshIndicatorMode.drag && _dragOffset! > _triggerLimit) {
      _mode = RefreshIndicatorMode.armed;
    }
  }

  // Stop showing the refresh indicator.
  Future<void> _dismiss(RefreshIndicatorMode newMode) async {
    await Future<void>.value();
    assert(newMode == RefreshIndicatorMode.canceled ||
        newMode == RefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode!) {
      case RefreshIndicatorMode.done:
        await _scaleController.animateTo(1, duration: _kIndicatorScaleDuration);
        break;
      case RefreshIndicatorMode.canceled:
        await _positionController.animateTo(0,
            duration: _kIndicatorScaleDuration);
        break;
      case RefreshIndicatorMode.armed:
      case RefreshIndicatorMode.drag:
      case RefreshIndicatorMode.refresh:
      case RefreshIndicatorMode.snap:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      _dragOffset = null;
      _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }

  void _show() {
    assert(_mode != RefreshIndicatorMode.refresh);
    assert(_mode != RefreshIndicatorMode.snap);
    final completer = Completer<void>();
    _mode = RefreshIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
            duration: _kIndicatorSnapDuration)
        .then<void>((void value) {
      if (mounted && _mode == RefreshIndicatorMode.snap) {
        setState(() {
          // Show the indeterminate progress indicator.
          _mode = RefreshIndicatorMode.refresh;
        });

        final refreshResult = widget.onRefresh();
        refreshResult.whenComplete(() {
          if (mounted && _mode == RefreshIndicatorMode.refresh) {
            completer.complete();
            _dismiss(RefreshIndicatorMode.done);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );

    return Stack(
      children: <Widget>[
        child,
        if (_mode != null)
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizeTransition(
              axisAlignment: _isIndicatorAtTop! ? 1.0 : -1.0,
              sizeFactor: _positionFactor,
              child: Container(
                padding: EdgeInsets.only(
                  top: widget.needTopPadding
                      ? _displacement + MediaQuery.of(context).padding.top
                      : _displacement,
                  bottom: _displacement + 10,
                ),
                alignment: Alignment.topCenter,
                child: ScaleTransition(
                  scale: _scaleFactor,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget? child) {
                      if (_mode == RefreshIndicatorMode.armed ||
                          _mode == RefreshIndicatorMode.snap) {
                        return _buildSizeIcon();
                      } else if (_dragOffset != null) {
                        return _buildSizeIcon(
                          value: _dragOffset! / _triggerLimit,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSizeIcon({
    double? value,
  }) {
    return SizedBox(
      width: widget.iconSize.toDouble(),
      height: widget.iconSize.toDouble(),
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: 2.8,
        color: _color,
      ),
    );
  }
}
