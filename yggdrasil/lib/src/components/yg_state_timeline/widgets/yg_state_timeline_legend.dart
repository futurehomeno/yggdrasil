// ignore_for_file: prefer-single-widget-per-file

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_chart/widgets/yg_single_row_legend.dart';
import 'package:yggdrasil/src/components/yg_state_timeline/models/_models.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/tokens/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// The legend of a [YgStateTimeline].
///
/// Shows one item per series. Like the [YgChartLegend] the items are laid
/// out on a single row that scrolls horizontally when it overflows, so the
/// legend never grows the component vertically.
class YgStateTimelineLegend extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgStateTimelineLegend({
    super.key,
    required this.series,
  });

  /// All series of the timeline, in the order they should be listed.
  final List<YgStateTimelineSeries> series;

  @override
  Widget build(BuildContext context) {
    return YgSingleRowLegend(
      children: <Widget>[
        for (final YgStateTimelineSeries currentSeries in series) _YgStateTimelineLegendItem(series: currentSeries),
      ],
    );
  }
}

class _YgStateTimelineLegendItem extends StatelessWidget {
  const _YgStateTimelineLegendItem({
    required this.series,
  });

  static const double _markerSize = 10.0;
  static const double _markerRadius = 3.0;

  final YgStateTimelineSeries series;

  @override
  Widget build(BuildContext context) {
    final YgColor colors = context.tokens.colors;

    return Semantics(
      label: series.label,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.tokens.dimensions.xxs,
          vertical: context.tokens.dimensions.xxs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // A rounded square, mirroring the rectangular segments on the
            // bar.
            Container(
              width: _markerSize,
              height: _markerSize,
              decoration: BoxDecoration(
                color: series.color ?? colors.iconDefault,
                borderRadius: BorderRadius.circular(_markerRadius),
              ),
            ),
            SizedBox(width: context.tokens.dimensions.xxs),
            Text(
              series.label,
              style: context.tokens.textStyles.caption1Medium.copyWith(
                color: colors.textDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
