import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_internal_state.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_internal_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Internal Tab widget.
///
/// Needed because [onPressed] should be handled by the tab bar it self.
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

  /// Called when this tab is pressed.
  final VoidCallback onPressed;

  @override
  State<YgTabInternal> createState() => _YgTabInternalState();
}

class _YgTabInternalState extends StateWithYgStateAndStyle<YgTabInternal, YgTabInternalState, YgTabInternalStyle> {
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
  void updateState() {
    // Nothing to update.
  }

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;
    final String? label = widget.label;
    final YgColorableIconData? icon = widget.icon;

    // No need to wrap this in an RepaintBoundary as the indicator will force a
    // repaint of this widget after it is clicked anyways.
    return YgAnimatedColoredBox(
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
    );
  }
}
