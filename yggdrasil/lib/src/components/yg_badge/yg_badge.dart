import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_badge/enums/yg_badge_variant.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_state.dart';
import 'package:yggdrasil/src/components/yg_badge/yg_badge_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_icon_badge.dart';
part 'yg_number_badge.dart';

/// [YgBadge] takes a child widget and overlays it with a badge.
abstract base class YgBadge extends StatefulWidget with StatefulWidgetDebugMixin {
  const factory YgBadge({
    Key? key,
    required int amount,
    required Widget child,
    YgBadgeWeight weight,
    Alignment alignment,
  }) = YgNumberBadge;

  const factory YgBadge.icon({
    Key? key,
    required Widget child,
    required YgColorableIconData icon,
    YgBadgeWeight weight,
    Alignment alignment,
  }) = YgIconBadge;

  const YgBadge._({
    super.key,
    required this.child,
    this.weight = YgBadgeWeight.weak,
    this.alignment = Alignment.topRight,
  });

  /// The child widget that the badge should show up on.
  final Widget child;

  /// The weight of the badge text style.
  final YgBadgeWeight weight;

  /// The alignment of the badge relative to the child.
  final Alignment alignment;

  Widget buildBadgeContent(BuildContext context, YgBadgeStyle style);

  YgBadgeVariant get variant;

  @override
  State<YgBadge> createState() => _YgBadgeState();
}

class _YgBadgeState extends StateWithYgStateAndStyle<YgBadge, YgBadgeState, YgBadgeStyle> {
  @override
  YgBadgeStyle createStyle() {
    return YgBadgeStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  YgBadgeState createState() {
    return YgBadgeState(
      weight: widget.weight,
      variant: widget.variant,
    );
  }

  @override
  void updateState() {
    state.weight.value = widget.weight;
    state.variant.value = widget.variant;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.alignment,
      children: <Widget>[
        YgAnimatedPadding(
          padding: style.childPadding,
          child: widget.child,
        ),
        YgAnimatedContainer(
          decoration: style.badgeDecoration,
          padding: style.contentPadding,
          child: widget.buildBadgeContent(context, style),
        ),
      ],
    );
  }
}
