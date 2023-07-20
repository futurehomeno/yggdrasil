import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgBottomSheetDragHandle extends StatelessWidget {
  const YgBottomSheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final YgBottomSheetTheme bottomSheetTheme = context.bottomSheetTheme;

    return Container(
      width: bottomSheetTheme.handleWidth,
      height: bottomSheetTheme.handleHeight,
      decoration: BoxDecoration(
        color: bottomSheetTheme.handleColor,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}
