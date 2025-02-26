import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_internal_state.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_internal_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTabInternal extends StatefulWidget {
  const YgTabInternal({
    super.key,
    required this.onPressed,
    this.icon,
    this.label,
  });

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final YgColorableIconData? icon;

  final VoidCallback onPressed;

  @override
  State<YgTabInternal> createState() => _YgTabInternalState();
}

class _YgTabInternalState extends StateWithYgStateAndStyle<YgTabInternal, YgTabInternalState, YgTabInternalStyle> {
  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;
    final String? label = widget.label;
    final YgColorableIconData? icon = widget.icon;

    return RepaintBoundary(
      child: YgAnimatedColoredBox(
        color: style.backgroundColor,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: widget.onPressed,
            onFocusChange: state.focused.update,
            onHover: state.hovered.update,
            splashFactory: InkRipple.splashFactory,
            child: Padding(
              padding: theme.tabInnerPadding + theme.tabOuterPadding,
              child: Column(
                children: <Widget>[
                  if (label != null)
                    DefaultTextStyleTransition(
                      style: style.textStyle,
                      child: Text(
                        label,
                      ),
                    ),
                  if (icon != null)
                    YgIcon(
                      icon,
                      size: YgIconSize.small,
                    ),
                ].withVerticalSpacing(theme.iconLabelSpacing),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  YgTabInternalState createState() {
    return YgTabInternalState();
  }

  @override
  YgTabInternalStyle createStyle() {
    return YgTabInternalStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {}
}
