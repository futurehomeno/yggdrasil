import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SliverView extends StatelessWidget {
  const SliverView({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody.sliver(
      loading: true,
      sliver: SliverList.builder(
        itemBuilder: (BuildContext context, int index) {
          return YgListTile(
            title: 'List Tile #${index + 1}',
          );
        },
      ),
    );
  }
}
