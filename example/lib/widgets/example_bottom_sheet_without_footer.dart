import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheetWithoutFooter extends YgBottomSheetModalRoute {
  @override
  RouteSettings get settings => const RouteSettings(name: 'ExampleBottomSheetWithoutFooter');

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: YgCard(
        variant: YgCardVariant.filled,
        child: YgListTile(
          title: 'Example content',
          subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
        ),
      ),
    );
  }
}
