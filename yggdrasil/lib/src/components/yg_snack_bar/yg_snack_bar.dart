import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_snack_bar_close_notification.dart';
import 'yg_snack_bar_style.dart';

class YgSnackBar extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgSnackBar({
    super.key,
    required this.message,
    this.variant = YgSnackBarVariant.highlight,
    this.onClosePressed,
  });

  final String message;
  final YgSnackBarVariant variant;
  final VoidCallback? onClosePressed;

  @override
  State<YgSnackBar> createState() => _YgSnackBarState();
}

class _YgSnackBarState extends StateWithYgStateAndStyle<YgSnackBar, YgSnackBarState, YgSnackBarStyle> {
  @override
  YgVariantState<YgSnackBarVariant> createState() {
    return YgSnackBarState(
      variant: widget.variant,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.variant;
  }

  @override
  YgSnackBarStyle createStyle() {
    return YgSnackBarStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final YgSnackBarTheme snackBarTheme = context.snackBarTheme;

    return Container(
      constraints: snackBarTheme.constraints,
      padding: snackBarTheme.padding,
      decoration: BoxDecoration(
        color: snackBarTheme.backgroundColor,
        borderRadius: snackBarTheme.borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: snackBarTheme.iconContainerSize,
            width: snackBarTheme.iconContainerSize,
            child: YgAnimatedDecoratedBox(
              decoration: style.iconBackgroundColor.map(
                (Color backgroundColor) => BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
              ),
              child: Center(
                child: YgAnimatedBuilder(
                  properties: <Listenable>{
                    style.icon,
                    style.iconColor,
                  },
                  builder: (BuildContext context, _) {
                    return YgIcon.colorable(
                      style.icon.value,
                      size: YgIconSize.small,
                      color: style.iconColor.value,
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: snackBarTheme.iconContainerSize,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.message,
                  style: snackBarTheme.messageTextStyle,
                ),
              ),
            ),
          ),
          YgIconButton(
            size: YgIconButtonSize.small,
            variant: YgIconButtonVariant.filled,
            onPressed: () => _onPressed(
              context: context,
            ),
            icon: YgIcons.cross,
          ),
        ].withHorizontalSpacing(snackBarTheme.messageSpacing),
      ),
    );
  }

  void _onPressed({
    required BuildContext context,
  }) {
    const YgSnackBarCloseNotification().dispatch(context);
    widget.onClosePressed?.call();
  }
}
