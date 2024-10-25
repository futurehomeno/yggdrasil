import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ExampleScrollableBottomSheet extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleScrollableBottomSheet';

  @override
  Widget buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Scrollable Bottom Sheet',
      content: const DemoPlaceholder(height: 1500),
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
