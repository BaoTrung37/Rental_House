import 'dart:async';


import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:batru_house_rental/presentation/widgets/error/loading_error_view.dart';
import 'package:batru_house_rental/presentation/widgets/infinite_list/refresh_view.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum InfiniteListType {
  list,
  grid,
}

mixin Datasource<E> {
  E get getData;
}

mixin InfiniteListDelegate {
  int get firstPage {
    return 1;
  }

  late final PagingController<int, Datasource> _infiniteListPagingController =
      PagingController(firstPageKey: firstPage);

  void replaceChunk({
    required List<Datasource> replacements,
    required CheckItemFunction condition,
  }) {
    final items = _infiniteListPagingController.itemList;
    if (items != null) {
      final start = items.indexWhere((element) => condition(element));
      final end = items.lastIndexWhere((element) => condition(element));
      items.replaceRange(start, end + 1, replacements);
      _infiniteListPagingController.itemList = items;
    }
  }

  void refreshNextPage() {
    _infiniteListPagingController.nextPageKey = firstPage + 1;
  }

  void reloadEverything() {
    _infiniteListPagingController.refresh();
  }
}

typedef FetchItemFunction = Future<List> Function(int pageKey, int perPage);
typedef CheckItemFunction = bool Function(Datasource item);
typedef PagedListCellBuilder = Widget Function(Datasource item, int index);

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({
    required this.perPage,
    required this.cellBuilder,
    required this.getDatasources,
    this.scrollController,
    this.type = InfiniteListType.list,
    this.separatorBuilder,
    this.firstKey = 1,
    this.scrollDirection = Axis.vertical,
    this.emptyView,
    this.onPullToRefreshComplete,
    this.paddings = EdgeInsets.zero,
    this.newPageIndicator,
    this.delegate,
    this.canPullToRefresh = false,
    this.gridDelegate,
    Key? key,
  })  : assert((type == InfiniteListType.grid && gridDelegate != null) ||
            type == InfiniteListType.list),
        super(key: key);

  final int perPage;
  final PagedListCellBuilder cellBuilder;
  final FetchItemFunction getDatasources;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? emptyView;
  final Widget? newPageIndicator;
  final VoidCallback? onPullToRefreshComplete;
  final Axis scrollDirection;
  final int firstKey;
  final EdgeInsets? paddings;
  final InfiniteListDelegate? delegate;
  final bool canPullToRefresh;
  final ScrollController? scrollController;

  final SliverGridDelegate? gridDelegate;
  final InfiniteListType type;
  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  late final PagingController<int, Datasource> _pagingController;

  @override
  void initState() {
    _pagingController = widget.delegate?._infiniteListPagingController ??
        PagingController(firstPageKey: 1);

    _pagingController.addPageRequestListener((pageKey) {
      _fetchNewPage(
        pageKey,
        widget.perPage,
        _pagingController,
        widget.getDatasources,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case InfiniteListType.list:
        if (widget.canPullToRefresh) {
          return _buildRefreshView(
            child: _buildPagedList(),
          );
        } else {
          return _buildPagedList();
        }
      case InfiniteListType.grid:
        if (widget.canPullToRefresh) {
          return _buildRefreshView(
            child: _buildGridView(),
          );
        } else {
          return _buildGridView();
        }
    }
  }

  RefreshView _buildRefreshView({required Widget child}) {
    return RefreshView(
      onRefresh: () => Future.sync(
        () {
          widget.onPullToRefreshComplete?.call();
          return _pagingController.refresh();
        },
      ),
      child: child,
    );
  }

  Widget _buildGridView() {
    return PagedGridView<int, Datasource>(
      padding: widget.paddings,
      pagingController: _pagingController,
      builderDelegate: _builderDelegate(),
      gridDelegate: widget.gridDelegate!,
    );
  }

  Widget _buildPagedList() {
    final separatedBuilder = widget.separatorBuilder;
    if (separatedBuilder != null) {
      return PagedListView<int, Datasource>.separated(
        separatorBuilder: separatedBuilder,
        padding: widget.paddings,
        scrollDirection: widget.scrollDirection,
        pagingController: _pagingController,
        builderDelegate: _builderDelegate(),
      );
    } else {
      return PagedListView<int, Datasource>(
          padding: widget.paddings,
          scrollController: widget.scrollController,
          scrollDirection: widget.scrollDirection,
          pagingController: _pagingController,
          builderDelegate: _builderDelegate());
    }
  }

  PagedChildBuilderDelegate<Datasource> _builderDelegate() {
    return PagedChildBuilderDelegate<Datasource>(
      itemBuilder: (context, item, index) => widget.cellBuilder(
        item,
        index,
      ),
      firstPageProgressIndicatorBuilder: (_) => const AppLoadingIndicator(),
      noItemsFoundIndicatorBuilder: (_) => widget.emptyView ?? Container(),
      firstPageErrorIndicatorBuilder: (_) => LoadingErrorView(
        onReload: _pagingController.retryLastFailedRequest,
      ),
      newPageProgressIndicatorBuilder: (_) =>
          widget.newPageIndicator ??
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            child: AppLoadingIndicator(),
          ),
      newPageErrorIndicatorBuilder: (_) => _buildNewPageErrorView(),
    );
  }

  Widget _buildNewPageErrorView() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: GestureDetector(
        onTap: () {
          _pagingController.retryLastFailedRequest();
        },
        child: AppIcons.refresh(
          size: 40,
          color: context.colors.iconPrimary,
        ),
      ),
    );
  }

  Future<void> _fetchNewPage(
    int pageKey,
    int pageSize,
    PagingController pagingController,
    FetchItemFunction getItem,
  ) async {
    try {
      // TODO https://dw-ml-nfc.atlassian.net/browse/DAF-1669
      await Future.delayed(const Duration());
      final newItems = await getItem.call(
        pageKey,
        widget.perPage,
      );
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
