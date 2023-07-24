import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleScrollableBottomSheet extends YgBottomSheetModalRoute {
  @override
  RouteSettings get settings => const RouteSettings(name: 'ExampleScrollableBottomSheet');

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Scrollable Bottom Sheet',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          25,
          (int index) => YgListTile(
            title: 'List item ${index + 1}',
            onTap: () {},
          ),
        ),
      ),
      footerButtons: YgButtonGroup(
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
