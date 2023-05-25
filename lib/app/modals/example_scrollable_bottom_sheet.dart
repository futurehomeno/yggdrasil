import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_route.dart';

class ExampleScrollableBottomSheet extends YgModalBottomSheetRoute {
  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Scrollable Bottom Sheet',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(
          25,
          (int index) => ListTile(
            title: Text('List item ${index + 1}'),
          ),
        ),
      ),
    );
  }
}
