import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheet extends YgBottomSheetModalRoute {
  @override
  RouteSettings get settings => const RouteSettings(name: 'ExampleBottomSheet');

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: Column(
        children: <Widget>[
          const YgListTile(
            title: 'Example content',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
          ),
          YgListTile(
            title: 'Clickable example content',
            subtitle: 'Bacon ipsum dolor amet chicken frankfurter burgdoggen landjaeger sirloin ham pig.',
            onTap: () {},
          ),
        ].separatedBy(const Divider()),
      ),
      footerButtons: YgButtonGroup(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () {},
            child: const Text('Button'),
          ),
        ],
      ),
    );
  }
}
