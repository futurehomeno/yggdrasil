import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_bottom_sheet_drag_handle.dart';

class YgBottomSheetHeader extends StatelessWidget {
  const YgBottomSheetHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;

    return Padding(
      padding: bottomSheetTheme.headerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Center(
            child: YgBottomSheetDragHandle(),
          ),
          Text(
            title,
            style: bottomSheetTheme.titleStyle,
          ),
        ].withVerticalSpacing(15.0),
      ),
    );
  }
}
