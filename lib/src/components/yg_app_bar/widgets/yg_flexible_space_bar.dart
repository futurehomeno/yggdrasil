import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_flexible_space_header_opacity.dart';

/// YGG version of [FlexibleSpaceBar].
///
/// Made to be able to modify how the text folds when scrolling.
///
/// See [FlexibleSpaceBar] for more information.
class YgFlexibleSpaceBar extends StatelessWidget {
  const YgFlexibleSpaceBar({
    super.key,
    this.title,
    this.background,
    this.centerTitle = false,
    required this.topTitlePadding,
    required this.bottomTitlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.stretchModes = const <StretchMode>[StretchMode.zoomBackground],
    this.expandedTitleScale = 1.5,
    this.actionsCount = 0,
    required this.hasLeading,
  }) : assert(expandedTitleScale >= 1, 'expandedTitleScale must be >= 1');

  /// New fields.
  final double topTitlePadding;
  final double bottomTitlePadding;

  /// See [FlexibleSpaceBar].
  final Widget? title;
  final Widget? background;
  final bool centerTitle;
  final CollapseMode collapseMode;
  final List<StretchMode> stretchModes;
  final double expandedTitleScale;
  final int actionsCount;
  final bool hasLeading;

  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;

        return -Tween<double>(begin: 0.0, end: deltaExtent / 4.0).transform(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final FlexibleSpaceBarSettings settings =
            context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;

        final List<Widget> children = <Widget>[];

        final double deltaExtent = settings.maxExtent - settings.minExtent;

        // 0.0 -> Expanded
        // 1.0 -> Collapsed to toolbar
        final double t = clampDouble(1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent, 0.0, 1.0);

        // background
        if (background != null) {
          final double fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
          const double fadeEnd = 1.0;
          assert(fadeStart <= fadeEnd);
          // If the min and max extent are the same, the app bar cannot collapse
          // and the content should be visible, so opacity = 1.
          final double opacity =
              settings.maxExtent == settings.minExtent ? 1.0 : 1.0 - Interval(fadeStart, fadeEnd).transform(t);
          double height = settings.maxExtent;

          // StretchMode.zoomBackground
          if (stretchModes.contains(StretchMode.zoomBackground) && constraints.maxHeight > height) {
            height = constraints.maxHeight;
          }
          final double topPadding = _getCollapsePadding(t, settings);
          children.add(Positioned(
            top: topPadding,
            left: 0.0,
            right: 0.0,
            height: height,
            child: YgFlexibleSpaceHeaderOpacity(
              // IOS is relying on this semantics node to correctly traverse
              // through the app bar when it is collapsed.
              alwaysIncludeSemantics: true,
              opacity: opacity,
              child: background,
            ),
          ));

          // StretchMode.blurBackground
          if (stretchModes.contains(StretchMode.blurBackground) && constraints.maxHeight > settings.maxExtent) {
            final double blurAmount = (constraints.maxHeight - settings.maxExtent) / 10;
            children.add(Positioned.fill(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ));
          }
        }

        // title
        if (title != null) {
          final ThemeData theme = Theme.of(context);

          Widget? parsedTitle;
          switch (theme.platform) {
            case TargetPlatform.iOS:
            case TargetPlatform.macOS:
              parsedTitle = title;
            case TargetPlatform.android:
            case TargetPlatform.fuchsia:
            case TargetPlatform.linux:
            case TargetPlatform.windows:
              parsedTitle = Semantics(
                namesRoute: true,
                child: title,
              );
          }

          // StretchMode.fadeTitle
          if (stretchModes.contains(StretchMode.fadeTitle) && constraints.maxHeight > settings.maxExtent) {
            final double stretchOpacity = 1 - clampDouble((constraints.maxHeight - settings.maxExtent) / 100, 0.0, 1.0);
            parsedTitle = Opacity(
              opacity: stretchOpacity,
              child: title,
            );
          }

          final double opacity = settings.toolbarOpacity;
          if (opacity > 0.0) {
            TextStyle titleStyle = theme.primaryTextTheme.titleLarge!;
            titleStyle = titleStyle.copyWith(
              color: titleStyle.color!.withOpacity(opacity),
            );

            // Calculate end padding for title based on number of action buttons.
            final double titlePaddingDueToActionButtons = actionsCount * context.iconButtonTheme.sizeMedium +
                context.appBarTheme.titleSpacing +
                context.appBarTheme.actionEdgeSpacing;
            final double endPaddingValue = Tween<double>(
              begin: context.appBarTheme.titleExpandedPadding,
              end: titlePaddingDueToActionButtons,
            ).transform(t);

            final double titlePaddingDueToLeadingButton = hasLeading
                ? context.iconButtonTheme.sizeMedium + context.appBarTheme.titleSpacing * 2
                : context.appBarTheme.titleExpandedPadding;
            final double startPaddingValue = Tween<double>(
              begin: context.appBarTheme.titleExpandedPadding,
              end: titlePaddingDueToLeadingButton,
            ).transform(t);

            final double bottomPaddingValue = Tween<double>(begin: bottomTitlePadding, end: 20.0).transform(t);
            final double topPaddingValue = Tween<double>(begin: topTitlePadding, end: 20.0).transform(t);
            final double scaleValue = Tween<double>(begin: expandedTitleScale, end: 1.0).transform(t);
            final Matrix4 scaleTransform = Matrix4.identity()..scale(scaleValue, scaleValue, 1.0);
            final Alignment titleAlignment = centerTitle ? Alignment.bottomCenter : Alignment.bottomLeft;
            // TODO(bjhandeland): Replace with tokens.
            final EdgeInsetsGeometry padding = EdgeInsetsDirectional.only(
              top: topPaddingValue,
              start: centerTitle ? 0.0 : startPaddingValue,
              bottom: bottomPaddingValue,
              end: endPaddingValue,
            );
            children.add(Container(
              padding: padding,
              child: Transform(
                alignment: titleAlignment,
                transform: scaleTransform,
                child: Align(
                  alignment: titleAlignment,
                  child: DefaultTextStyle(
                    style: titleStyle,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          width: constraints.maxWidth / scaleValue,
                          alignment: titleAlignment,
                          child: parsedTitle,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
          }
        }

        return ClipRect(child: Stack(children: children));
      },
    );
  }
}
