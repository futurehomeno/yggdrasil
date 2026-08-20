import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/models/_models.dart';
import 'package:yggdrasil/src/components/yg_icon/_yg_icon.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// The tappable badge of one [YgChartEventMarker] on a [YgChart].
class YgChartEventMarkerBadge extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgChartEventMarkerBadge({
    super.key,
    required this.marker,
    this.selected = false,
    this.onTap,
  });

  /// Diameter of the badge circle.
  static const double diameter = 20.0;

  /// Padding around the circle that is part of the tap target but not
  /// visible.
  ///
  /// The selection ring is drawn inside this padding, so selecting a badge
  /// does not change its footprint.
  static const double tapPadding = 6.0;

  static const double _iconSize = 12.0;
  static const double _selectionRingWidth = 2.0;
  static const double _selectionRingGap = 2.0;

  /// The marker the badge renders, see [YgChartEventMarker].
  final YgChartEventMarker marker;

  /// Whether the badge is marked with a selection ring around its circle.
  final bool selected;

  /// Called with [marker] when the badge is tapped.
  final ValueChanged<YgChartEventMarker>? onTap;

  @override
  Widget build(BuildContext context) {
    final ValueChanged<YgChartEventMarker>? onTap = this.onTap;
    final YgColorableIconData? icon = marker.icon;
    const double ringInset = _selectionRingWidth + _selectionRingGap;

    return Semantics(
      button: onTap != null,
      selected: selected,
      label: marker.label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap == null ? null : () => onTap(marker),
        child: Padding(
          padding: const EdgeInsets.all(tapPadding - ringInset),
          child: AnimatedContainer(
            duration: context.defaults.animationDuration,
            curve: context.defaults.animationCurve,
            width: diameter + 2.0 * ringInset,
            height: diameter + 2.0 * ringInset,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? marker.color : Colors.transparent,
                width: _selectionRingWidth,
              ),
            ),
            child: Container(
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                color: marker.color,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: icon != null
                  ? SizedBox.square(
                      dimension: _iconSize,
                      child: FittedBox(
                        child: YgIcon.colorable(
                          icon,
                          color: marker.foregroundColor,
                        ),
                      ),
                    )
                  : FittedBox(
                      // Scale down only, so a long count shrinks into the
                      // badge instead of a short one growing to fill it.
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${marker.count}',
                        style: context.tokens.textStyles.caption1Bold.copyWith(
                          color: marker.foregroundColor,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
