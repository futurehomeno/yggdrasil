import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Internal Tab widget.
///
/// Needed because [onPressed] should be handled by the tab bar it self.
class YgTabInternal extends StatelessWidget {
  const YgTabInternal({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.controller,
    required this.index,
  });

  /// Text to show inside the tab.
  final String? label;

  /// Icon to show inside the tab.
  final YgColorableIconData? icon;

  /// Called when this tab is pressed.
  final VoidCallback onPressed;

  /// The tab controller.
  ///
  /// Required to animate the font of the tab.
  final TabController controller;

  /// The index of the tab.
  ///
  /// Used to compare to the current value of the tab controller.
  final int index;

  @override
  Widget build(BuildContext context) {
    final YgTabsTheme theme = context.tabsTheme;
    final String? label = this.label;
    final YgColorableIconData? icon = this.icon;

    // No need to wrap this in an RepaintBoundary as the indicator will force a
    // repaint of this widget after it is clicked anyways.
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        splashFactory: InkRipple.splashFactory,
        focusColor: theme.focusBackgroundColor,
        hoverColor: theme.hoverBackgroundColor,
        child: Padding(
          padding: theme.tabInnerPadding + theme.tabOuterPadding,
          child: Column(
            children: <Widget>[
              if (label != null)
                ListenableBuilder(
                  listenable: controller.animation!,
                  builder: (BuildContext context, Widget? child) {
                    final YgTabsTheme theme = context.tabsTheme;
                    final double position = controller.animation?.value ?? 0;
                    final double distance = (position - index).abs();
                    final double selected = max(0, 1 - distance);

                    return DefaultTextStyle(
                      style: theme.unselectedLabelTextStyle.lerp(
                        theme.selectedLabelTextStyle,
                        selected,
                      ),
                      child: child!,
                    );
                  },
                  child: Text(label),
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
    );
  }
}
