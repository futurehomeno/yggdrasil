import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ScrollableView extends StatelessWidget {
  const ScrollableView({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 1; i <= 25; i++)
            YgListTile(
              title: 'List Tile #$i',
            ),
        ],
      ),
    );
  }
}
