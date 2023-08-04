import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheetWithoutFooter extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheetWithoutFooter';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: YgCard(
        variant: YgCardVariant.filled,
        child: YgListTile(
          title: 'Example content',
          subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        ),
      ),
    );
  }
}
