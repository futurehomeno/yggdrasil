import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_bottom_sheet_close_pressed_notification.dart';
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
      padding: bottomSheetTheme.headerHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Center(
            child: YgBottomSheetDragHandle(),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: bottomSheetTheme.titleStyle,
                ),
              ),
              YgIconButton(
                variant: YgIconButtonVariant.tonal,
                icon: YgIcons.cross,
                size: YgIconButtonSize.small,
                onPressed: () => const YgBottomSheetClosePressedNotification().dispatch(
                  context,
                ),
              ),
            ].withHorizontalSpacing(bottomSheetTheme.titleCloseButtonSpacing),
          ),
        ].withVerticalSpacing(bottomSheetTheme.handleTitleSpacing),
      ),
    );
  }
}
