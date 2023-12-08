import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_icon_badge.dart';
part 'yg_number_badge.dart';

/// [YgBadge] takes a child widget and overlays it with a badge.
abstract base class YgBadge extends StatelessWidget with StatelessWidgetDebugMixin {
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
    required YgIcon icon,
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

  @override
  Widget build(BuildContext context) {
    final YgBadgeTheme badgeTheme = context.badgeTheme;

    return Stack(
      alignment: alignment,
      children: <Widget>[
        _buildChild(context),
        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              color: YgBadgeMapper.getBadgeColor(
                theme: badgeTheme,
                weight: weight,
              ),
              borderRadius: badgeTheme.borderRadius,
            ),
            child: _buildBadgeContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeContent(BuildContext context);

  Widget _buildChild(BuildContext context) => child;
}
