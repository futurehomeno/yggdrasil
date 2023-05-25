import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet_route.dart';

class ExampleBottomSheet extends YgModalBottomSheetRoute {
  @override
  YgBottomSheet buildBottomSheet(BuildContext context) {
    return YgBottomSheet(
      title: 'Example Bottom Sheet',
      content: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('Example content'),
          ),
        ),
      ),
    );
  }
}
