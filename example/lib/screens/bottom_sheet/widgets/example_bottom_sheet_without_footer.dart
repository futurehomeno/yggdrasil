import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/demo_placeholder.dart';

class ExampleBottomSheetWithoutFooter extends YgBottomSheetModalRoute {
  @override
  String get name => 'ExampleBottomSheetWithoutFooter';

  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return const YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: YgSection(
        child: DemoPlaceholder(
          height: 200,
        ),
      ),
    );
  }
}
