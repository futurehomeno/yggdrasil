import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SliverView extends StatelessWidget {
  const SliverView({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody.sliver(
      sliver: SliverList.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 25) {
            return const YgSection(
              child: YgTextField.email(
                label: 'email',
                textInputAction: TextInputAction.done,
              ),
            );
          }

          return YgListTile(
            title: 'List Tile #${index + 1}',
          );
        },
      ),
    );
  }
}
