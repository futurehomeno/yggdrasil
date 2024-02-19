import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/demo_placeholder.dart';

class ExampleBottomSheetWithFooter extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheetWithoutFooter';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: const DemoPlaceholder(
        height: 200,
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
