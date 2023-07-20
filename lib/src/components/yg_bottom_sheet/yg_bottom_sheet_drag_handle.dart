import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgBottomSheetDragHandle extends StatelessWidget {
  const YgBottomSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;

    // TODO(bjhandeland): Move handle values to theme.
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: bottomSheetTheme.handleBarColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}
