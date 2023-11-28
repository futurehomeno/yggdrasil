import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleBottomSheet extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheet';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: YgSection.list(
        children: <YgListTile>[
          const YgListTile(
            title: 'Example content',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          YgListTile(
            title: 'Clickable example content',
            subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            onTap: () {},
          ),
        ],
      ),
      footerButtons: YgButtonGroup.vertical(
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
