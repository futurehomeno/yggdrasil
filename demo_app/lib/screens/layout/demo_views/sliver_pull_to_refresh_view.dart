import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SliverPullToRefreshView extends StatefulWidget {
  const SliverPullToRefreshView({super.key});

  @override
  State<SliverPullToRefreshView> createState() => _SliverPullToRefreshViewState();
}

class _SliverPullToRefreshViewState extends State<SliverPullToRefreshView> {
  int _itemCount = 20;

  Future<void> _handleRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }
    setState(() {
      _itemCount += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody.sliver(
      onRefresh: _handleRefresh,
      sliver: SliverList.builder(
        itemCount: _itemCount,
        itemBuilder: (BuildContext context, int index) {
          return YgListTile(
            title: 'List Tile #${index + 1}',
          );
        },
      ),
    );
  }
}
