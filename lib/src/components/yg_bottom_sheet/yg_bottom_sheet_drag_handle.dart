import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

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
        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
      ),
    );
  }
}
