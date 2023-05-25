import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/modal/yg_bottom_sheet_modal_route.dart';
import 'package:yggdrasil/src/components/yg_bottom_sheet/yg_bottom_sheet.dart';

class ExampleBottomSheet extends YgBottomSheetModalRoute {
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
