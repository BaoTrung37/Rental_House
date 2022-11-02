import 'package:batru_house_rental/presentation/utilities/utilities.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TextFieldControlElement {
  late final _stateKey = GlobalKey<FormFieldState>();

  var _focusNode = FocusNode();
  var _isHavingSpecialError = false;

  FocusNode get focusNode => _focusNode;
  GlobalKey<FormFieldState> get stateKey => _stateKey;
  bool get isHavingSpecialError => _isHavingSpecialError;

  // In case of not a text field (i.e: check box, ...),
  // call this function when validate and catch a empty error
  void setSpecialError(bool isHavingError) {
    _isHavingSpecialError = isHavingError;
  }

  // In case of show and hide text field,
  // must call this function before show the text field again
  void reviveFocusNode() {
    _focusNode = FocusNode();
  }

  void resetError() {
    _stateKey.currentState?.reset();
    _isHavingSpecialError = false;
  }
}

mixin BaseFormMixin<T extends StatefulWidget> on State<T> {
  final _formKey = GlobalKey<FormState>();
  final _columnKey = GlobalKey();
  final _scrollController = ScrollController();

  GlobalKey get columnKey => _columnKey;
  ScrollController get scrollController => _scrollController;

  List<TextFieldControlElement> _controls = [];
  List<TextFieldControlElement> get controls => _controls;

  // must call in init state for the scroll to error function to work.
  void setupAutoScrollToErrorFields(List<TextFieldControlElement> controls) {
    setState(() {
      _controls = controls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTapDown: (_) => Utilities.unFocus(),
        behavior: HitTestBehavior.translucent,
        child: buildFormContent(),
      ),
    );
  }

  Widget buildFormContent();

  void validate({
    required VoidCallback onSuccess,
    VoidCallback? onFailure,
  }) {
    Utilities.unFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          if (_formKey.currentState?.validate() == true) {
            onSuccess();
          } else {
            // scrollToInvalidField();
            onFailure?.call();
          }
        });
      }
    });
  }

  void scrollToInvalidField() {
    final firstErrorField = _controls.firstWhereOrNull((element) =>
        element.isHavingSpecialError ||
        element.stateKey.currentState?.hasError == true);

    if (firstErrorField != null) {
      final phoneBox = firstErrorField.stateKey.currentContext
          ?.findRenderObject() as RenderBox?;
      final columnBox =
          _columnKey.currentContext?.findRenderObject() as RenderBox?;
      final position =
          phoneBox?.localToGlobal(Offset.zero, ancestor: columnBox);
      final y = position?.dy;

      if (y != null) {
        // add a little padding to top after scroll
        _scrollController.animateTo(y - 40,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }

      FocusScope.of(context).requestFocus(firstErrorField.focusNode);
    }
  }

  void resetErrorMessage() {
    setState(() {
      for (final element in controls) {
        element.resetError();
      }
    });
  }
}
