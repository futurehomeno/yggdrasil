import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleScrollableBottomSheet extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleScrollableBottomSheet';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Scrollable Bottom Sheet',
      content: YgSection.list(
        mainAxisSize: MainAxisSize.min,
        children: List<YgListTile>.generate(
          25,
          (int index) => YgListTile(
            title: 'List item ${index + 1}',
            onTap: () {},
          ),
        ),
      ),
      footerButtons: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () {},
            child: const Text('Primary button'),
          ),
          YgButton(
            variant: YgButtonVariant.secondary,
            onPressed: () {},
            child: const Text('Secondary button'),
          ),
        ],
      ),
    );
  }
}
