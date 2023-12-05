import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_state.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// [YgBadge] takes a child widget and overlays it with a badge.
class YgBadge extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgBadge({
    super.key,
    required this.amount,
    required this.child,
    this.weight = YgBadgeWeight.weak,
    this.alignment = Alignment.topRight,
  });

  /// The amount of items the badge should show.
  final int amount;

  /// The child widget that the badge should show up on.
  final Widget child;

  /// The weight of the badge text style.
  final YgBadgeWeight weight;

  /// The alignment of the badge relative to the child.
  final Alignment alignment;

  static const double _badgeMinSize = 20.0;
  static const int _maxBadgeCount = 9;

  @override
  State<YgBadge> createState() => _YgBadgeState();
}

class _YgBadgeState extends StateWithYgStyle<YgBadge, YgBadgeStyle> {
  late final YgBadgeState _state = YgBadgeState(
    weight: widget.weight,
  );

  @override
  YgBadgeStyle createStyle() {
    return YgBadgeStyle(
      state: _state,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant YgBadge oldWidget) {
    _state.weight.value = widget.weight;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Stack(
      alignment: widget.alignment,
      children: <Widget>[
        widget.child,
        YgAnimatedContainer(
          padding: const YgDrivenEdgeInsetsProperty.all(
            value: EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 2.0,
            ),
          ),
          decoration: style.badgeColor.map(
            (Color color) => BoxDecoration(
              color: color,
              borderRadius: badgeTheme.borderRadius,
            ),
          ),
          constraints: const YgDrivenBoxConstraintsProperty.all(
            value: BoxConstraints(
              minWidth: YgBadge._badgeMinSize,
              minHeight: YgBadge._badgeMinSize,
            ),
          ),
          child: Center(
            widthFactor: 1,
            child: DefaultTextStyleTransition(
              style: style.textStyle,
              child: Text(
                widget.amount > YgBadge._maxBadgeCount ? '${YgBadge._maxBadgeCount}+' : widget.amount.toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
