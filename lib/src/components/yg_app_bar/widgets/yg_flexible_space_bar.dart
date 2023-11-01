import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

/// YGG version of [FlexibleSpaceBar].
///
/// Made to be able to modify how the text folds when scrolling.
///
/// See [FlexibleSpaceBar] for more information.
class YgFlexibleSpaceBar extends StatelessWidget {
  const YgFlexibleSpaceBar({
    super.key,
    required this.title,
    required this.topTitlePadding,
    required this.bottomTitlePadding,
    this.collapseMode = CollapseMode.parallax,
    this.expandedTitleScale = 1.5,
    this.actionsCount = 0,
    required this.hasLeading,
  }) : assert(expandedTitleScale >= 1, 'expandedTitleScale must be >= 1');

  /// New fields.
  final double topTitlePadding;
  final double bottomTitlePadding;

  /// See [FlexibleSpaceBar].
  final Widget title;
  final CollapseMode collapseMode;
  final double expandedTitleScale;
  final int actionsCount;
  final bool hasLeading;

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

        // Calculate end padding for title based on number of action buttons.
        final double titlePaddingDueToActionButtons = actionsCount * context.iconButtonTheme.sizeMedium +
            context.appBarTheme.titleSpacing +
            context.appBarTheme.appBarPadding;
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
        const Alignment titleAlignment = Alignment.bottomLeft;

        final EdgeInsetsGeometry padding = EdgeInsetsDirectional.only(
          top: topPaddingValue,
          start: startPaddingValue,
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
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    width: constraints.maxWidth / scaleValue,
                    alignment: titleAlignment,
                    child: title,
                  );
                },
              ),
            ),
          ),
        ));

        return ClipRect(
          child: Stack(
            children: children,
          ),
        );
      },
    );
  }
}
