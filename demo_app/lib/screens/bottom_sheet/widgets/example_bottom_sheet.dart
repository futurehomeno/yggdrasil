import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ExampleBottomSheet extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheet';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: DemoPlaceholder(
        height: 200,
      ),
    );
  }
}
