import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/_yg_icon.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/yg_debug/_yg_debug.dart';

import 'yg_bottom_navigation_bar_item.dart';

/// A bottom navigation bar showing a configurable number of items.
///
/// Each item shows an icon, a title, and optionally a subtitle. The currently
/// selected item is highlighted with an animated indicator that slides between
/// items as the selection changes. Items are positioned with [AnimatedPositioned]
/// in a stack so that adding or removing an item — including in the middle of
/// the list — smoothly resizes and reflows the remaining items. Newly inserted
/// items fade in.
///
/// Items are matched across rebuilds by [YgBottomNavigationBarItem.title], so
/// titles must be unique within a single bar for the layout animation to track
/// items correctly.
///
/// Safe area handling
/// ------------------
/// By default, the bar applies bottom [SafeArea] padding so it can be used
/// directly as the bottom widget of a screen — including the recommended
/// pattern of passing it to [YgLayout]'s `bottomNavigationBar` slot. The
/// layout reserves vertical space for the bar and strips the bottom inset
/// from the content's [MediaQuery], leaving the bar to own the safe area.
///
/// When the bar is wrapped in a parent that *already* pads the bottom inset
/// itself (e.g. [YgLayoutBody]'s `footer` slot), set [applySafeArea] to
/// false to avoid padding the bar twice.
class YgBottomNavigationBar extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.showSubtitle = false,
    this.applySafeArea = true,
  }) : assert(items.length > 0, 'YgBottomNavigationBar requires at least one item'),
       assert(
         currentIndex >= 0 && currentIndex < items.length,
         'currentIndex must be within the items range',
       );

  /// The items shown inside of the bar.
  ///
  /// Typically 3 to 5 items. Items must have unique [YgBottomNavigationBarItem.title]
  /// values within a single bar so that insertion/removal animations can track
  /// them correctly.
  final List<YgBottomNavigationBarItem> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Called when an item is tapped, providing the index of the tapped item.
  final ValueChanged<int> onTap;

  /// Whether to show the optional [YgBottomNavigationBarItem.subtitle] below
  /// the title.
  final bool showSubtitle;

  /// Whether the bar should pad itself for the bottom safe area.
  ///
  /// Set to `false` when the bar is wrapped by a parent that already handles
  /// the bottom inset, so the safe area is not consumed twice.
  final bool applySafeArea;

  @override
  Widget build(BuildContext context) {
    assert(() {
      final Set<String> seen = <String>{};
      for (final YgBottomNavigationBarItem item in items) {
        if (!seen.add(item.title)) {
          throw FlutterError(
            'YgBottomNavigationBar items must have unique titles — '
            'titles are used as keys for layout animations. '
            'Duplicate title: "${item.title}".',
          );
        }
      }
      return true;
    }());

    final YgBottomNavigationBarTheme theme = context.bottomNavigationBarTheme;

    Widget content = Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          border: Border(
            top: BorderSide(
              color: theme.dividerColor,
              width: theme.dividerHeight,
            ),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double totalWidth = constraints.maxWidth;
            final double itemWidth = totalWidth / items.length;
            return SizedBox(
              width: totalWidth,
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    // Invisible reference row that drives the intrinsic height
                    // of the bar so the [Stack] can size itself even though all
                    // visible items are absolutely positioned.
                    IgnorePointer(
                      child: Visibility(
                        visible: false,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Row(
                          children: <Widget>[
                            for (final YgBottomNavigationBarItem item in items)
                              Expanded(
                                child: _Item(
                                  item: item,
                                  selected: false,
                                  showSubtitle: showSubtitle,
                                  onTap: null,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: theme.animationDuration,
                      curve: theme.animationCurve,
                      top: 0,
                      left: currentIndex * itemWidth,
                      width: itemWidth,
                      height: theme.indicatorHeight,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.indicatorColor,
                            borderRadius: theme.indicatorRadius,
                          ),
                        ),
                      ),
                    ),
                    for (int i = 0; i < items.length; i++)
                      AnimatedPositioned(
                        key: ValueKey<String>(items[i].title),
                        duration: theme.animationDuration,
                        curve: theme.animationCurve,
                        left: i * itemWidth,
                        top: 0,
                        bottom: 0,
                        width: itemWidth,
                        child: _AppearingItem(
                          duration: theme.animationDuration,
                          curve: theme.animationCurve,
                          child: _Item(
                            item: items[i],
                            selected: i == currentIndex,
                            showSubtitle: showSubtitle,
                            onTap: () => onTap(i),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

    if (applySafeArea) {
      content = SafeArea(
        top: false,
        child: content,
      );
    }

    return content;
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}

/// Fades a newly inserted item in from 0 → 1 on its first build.
///
/// Items that are simply rebuilt (existing items with the same key) keep the
/// internal [TweenAnimationBuilder] state, so they do not re-animate.
class _AppearingItem extends StatelessWidget {
  const _AppearingItem({
    required this.duration,
    required this.curve,
    required this.child,
  });

  final Duration duration;
  final Curve curve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.item,
    required this.selected,
    required this.showSubtitle,
    required this.onTap,
  });

  final YgBottomNavigationBarItem item;
  final bool selected;
  final bool showSubtitle;

  /// `null` when the item is being rendered for layout-measurement only
  /// (the invisible reference row inside the bar) and shouldn't be interactive.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgBottomNavigationBarTheme theme = context.bottomNavigationBarTheme;
    final String? subtitle = item.subtitle;

    final Color iconColor = selected ? theme.selectedIconColor : theme.unselectedIconColor;
    final TextStyle titleStyle = selected ? theme.selectedTitleTextStyle : theme.unselectedTitleTextStyle;
    final TextStyle subtitleStyle = selected ? theme.selectedSubtitleTextStyle : theme.unselectedSubtitleTextStyle;

    return InkWell(
      onTap: onTap,
      hoverColor: theme.hoverBackgroundColor,
      splashColor: theme.pressedBackgroundColor,
      child: Padding(
        padding: theme.itemPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(end: iconColor),
              duration: theme.animationDuration,
              curve: theme.animationCurve,
              builder: (BuildContext context, Color? animatedColor, Widget? _) {
                return IconTheme(
                  data: IconThemeData(color: animatedColor),
                  child: YgIcon(
                    item.icon,
                    size: YgIconSize.small,
                  ),
                );
              },
            ),
            SizedBox(height: theme.iconLabelSpacing),
            AnimatedDefaultTextStyle(
              duration: theme.animationDuration,
              curve: theme.animationCurve,
              style: titleStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              child: Text(item.title),
            ),
            if (showSubtitle && subtitle != null) ...<Widget>[
              SizedBox(height: theme.titleSubtitleSpacing),
              AnimatedDefaultTextStyle(
                duration: theme.animationDuration,
                curve: theme.animationCurve,
                style: subtitleStyle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                child: Text(subtitle),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
