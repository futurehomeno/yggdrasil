import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_state.dart';
import 'package:yggdrasil/src/components/yg_tab_bar/tab/yg_tab_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTab extends StatefulWidget {
  const YgTab({
    super.key,
    this.icon,
    this.label,
  });

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final YgColorableIconData? icon;

  @override
  State<YgTab> createState() => _YgTabState();
}

class _YgTabState extends StateWithYgStateAndStyle<YgTab, YgTabState, YgTabStyle> {
  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;
    final String? label = widget.label;
    final YgColorableIconData? icon = widget.icon;

    return YgAnimatedColoredBox(
      color: style.backgroundColor,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
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

  @override
  YgTabState createState() {
    return YgTabState();
  }

  @override
  YgTabStyle createStyle() {
    return YgTabStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {}
}
