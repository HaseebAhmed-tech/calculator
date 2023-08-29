import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loadmore/loadmore.dart';

import '../loading/my_loading_delegate.dart';
import '../loading/shimmer_loading.dart';

class GenericListView<T, T1> extends StatelessWidget {
  final List<T> dataList;
  final List<T1> widgets;
  final Future<void> Function() onRefresh;
  final Future<bool> Function() onLoadMore;
  final Function onDelete;
  const GenericListView({
    super.key,
    required this.widgets,
    required this.dataList,
    required this.onRefresh,
    required this.onLoadMore,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: dataList.isEmpty
          ? const ShimmerLoading()
          : LoadMore(
              onLoadMore: onLoadMore,
              isFinish: dataList.isEmpty,
              delegate: MyLoadingDelegate(),
              textBuilder: DefaultLoadMoreTextBuilder.english,
              whenEmptyLoad: false,
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];
                  return Slidable(
                      startActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            spacing: 0,
                            onPressed: (context) {},
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.share,
                            label: 'Share',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => onDelete(item),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: widgets[index] as Widget);
                },
              ),
            ),
    );
  }
}
