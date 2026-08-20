import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/src/components/yg_chart/yg_chart_data_manager.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('YgChartDataManager', () {
    YgChartSeries buildSeries({
      String id = 'series',
      List<double> values = const <double>[0.0, 5.0, 10.0],
      YgChartSeriesType type = YgChartSeriesType.bar,
      YgChartAxis axis = YgChartAxis.left,
      List<double>? lowerValues,
      List<double>? upperValues,
    }) {
      return YgChartSeries(
        id: id,
        label: id,
        values: values,
        unit: 'kWh',
        type: type,
        axis: axis,
        lowerValues: lowerValues,
        upperValues: upperValues,
      );
    }

    YgChartSeries buildBandSeries({
      String id = 'band',
      List<double> values = const <double>[22.0, 23.0, 24.0],
      List<double> lowerValues = const <double>[21.0, 22.0, 23.0],
      List<double> upperValues = const <double>[23.0, 24.0, 25.0],
    }) {
      return buildSeries(
        id: id,
        values: values,
        type: YgChartSeriesType.band,
        lowerValues: lowerValues,
        upperValues: upperValues,
      );
    }

    test('new series animates in from zero', () {
      final YgChartDataManager manager = YgChartDataManager();

      final bool changed = manager.updateData(
        <YgChartSeries>[buildSeries()],
        valueCount: 3,
        tickCount: 5,
      );

      expect(changed, isTrue);

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('series'), <double>[0.0, 0.0, 0.0]);

      manager.applyAnimationValue(1.0);
      expect(manager.currentValuesOf('series'), <double>[0.0, 5.0, 10.0]);
    });

    test('removed series animates out to zero and is pruned', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a'),
          buildSeries(id: 'b', values: <double>[2.0, 2.0, 2.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[buildSeries(id: 'a')],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.5);
      expect(manager.currentValuesOf('b'), <double>[1.0, 1.0, 1.0]);
      expect(manager.orderedSeries, hasLength(2));

      manager.applyAnimationValue(1.0);
      expect(
        manager.orderedSeries.map((YgChartSeries series) => series.id),
        <String>['a'],
      );
    });

    test('removed line series fades out in place and is pruned', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a'),
          buildSeries(id: 'b', values: <double>[2.0, 2.0, 2.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[buildSeries(id: 'a')],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.15);
      // The line keeps its position and fades instead of collapsing to
      // zero, and nothing else moves while it fades.
      expect(manager.currentValuesOf('b'), <double>[2.0, 2.0, 2.0]);
      expect(manager.opacityOf('b'), greaterThan(0.0));
      expect(manager.opacityOf('b'), lessThan(1.0));
      expect(manager.movementProgress, 0.0);
      expect(manager.orderedSeries, hasLength(2));

      // Fully faded and pruned before the axis movement starts.
      manager.applyAnimationValue(0.35);
      expect(
        manager.orderedSeries.map((YgChartSeries series) => series.id),
        <String>['a'],
      );

      manager.applyAnimationValue(1.0);
      expect(manager.movementProgress, 1.0);
    });

    test('new line series fades in at its values', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[1.0, 2.0, 3.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('series'), <double>[1.0, 2.0, 3.0]);
      expect(manager.opacityOf('series'), 0.0);

      manager.applyAnimationValue(1.0);
      expect(manager.opacityOf('series'), 1.0);
    });

    test('hiding a series rescales the axis right away', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a'),
          buildSeries(id: 'b', values: <double>[0.0, 10.0, 20.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);
      expect(manager.finalMaxOf(YgChartAxis.left), 20.0);

      manager.updateData(
        <YgChartSeries>[buildSeries(id: 'a')],
        valueCount: 3,
        tickCount: 5,
      );

      // The fading line no longer contributes to the axis extent.
      expect(manager.finalMaxOf(YgChartAxis.left), 10.0);
    });

    test('unchanged data does not report a change', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[buildSeries()],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      final bool changed = manager.updateData(
        <YgChartSeries>[buildSeries()],
        valueCount: 3,
        tickCount: 5,
      );

      expect(changed, isFalse);
    });

    test('axis range is rounded to nice steps', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[1.0, 5.0, 10.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      // 4 intervals for a 0..10 range: step 2.5.
      expect(manager.finalMinOf(YgChartAxis.left), 0.0);
      expect(manager.finalMaxOf(YgChartAxis.left), 10.0);
      expect(manager.precisionOf(YgChartAxis.left), 1);
    });

    test('negative values extend the axis below zero', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[-3.0, 5.0, 10.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      expect(manager.finalMinOf(YgChartAxis.left), lessThanOrEqualTo(-3.0));
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(10.0));

      // Zero must sit on a gridline: min and max are multiples of the step.
      final double range = manager.finalMaxOf(YgChartAxis.left) - manager.finalMinOf(YgChartAxis.left);
      final double step = range / 4;
      expect(manager.finalMinOf(YgChartAxis.left) % step, 0.0);
    });

    test('bar series stack per index for the axis range', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a', values: <double>[4.0, 4.0, 4.0]),
          buildSeries(id: 'b', values: <double>[4.0, 4.0, 4.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(8.0));
    });

    test('line series do not stack for the axis range', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a', values: <double>[4.0, 4.0, 4.0], type: YgChartSeriesType.line),
          buildSeries(id: 'b', values: <double>[4.0, 4.0, 4.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      // The lines do not stack to 8, the axis only pads around the flat
      // 4.0 lines.
      expect(manager.finalMaxOf(YgChartAxis.left), lessThan(8.0));
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(4.0));
      expect(manager.finalMinOf(YgChartAxis.left), lessThanOrEqualTo(4.0));
    });

    test('line only axis above zero zooms in on the data', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'temperature', values: <double>[20.0, 22.0, 24.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      // The range hugs the data instead of starting at zero, so small
      // variations stay visible.
      expect(manager.finalMinOf(YgChartAxis.left), 20.0);
      expect(manager.finalMaxOf(YgChartAxis.left), 24.0);
    });

    test('floating axis grows one nice step at a time', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'temperature', values: <double>[25.1, 26.0, 28.2], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 3,
      );

      // The initial step of 2.0 gives 24..28 which just misses the max.
      // The next rung of the ladder is 2.5 (not 5.0), so the range becomes
      // 25..30 instead of blowing up to 25..35.
      expect(manager.finalMinOf(YgChartAxis.left), 25.0);
      expect(manager.finalMaxOf(YgChartAxis.left), 30.0);
    });

    test('floating axis snaps its bounds to multiples of the snap value', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'temperature', values: <double>[24.5, 26.0, 26.9], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 3,
        leftAxisSnap: 5.0,
      );

      // Instead of hugging 24.5..26.9 the axis rounds outwards to full
      // multiples of 5, so charts of the same kind are easy to compare.
      expect(manager.finalMinOf(YgChartAxis.left), 20.0);
      expect(manager.finalMaxOf(YgChartAxis.left), 30.0);
    });

    test('flat line only axis gets a padded range around its value', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'temperature', values: <double>[21.0, 21.0, 21.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      expect(manager.finalMinOf(YgChartAxis.left), lessThan(21.0));
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThan(21.0));
      expect(manager.finalMinOf(YgChartAxis.left), greaterThanOrEqualTo(0.0));
    });

    test('bar series keep the axis anchored at zero', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[20.0, 22.0, 24.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      expect(manager.finalMinOf(YgChartAxis.left), 0.0);
    });

    test('zero lines of both axes align', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'consumption', values: <double>[2.0, 4.0, 8.0]),
          buildSeries(
            id: 'price',
            values: <double>[-2.0, 1.0, 4.0],
            type: YgChartSeriesType.line,
            axis: YgChartAxis.right,
          ),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      final double leftMin = manager.finalMinOf(YgChartAxis.left);
      final double leftMax = manager.finalMaxOf(YgChartAxis.left);
      final double rightMin = manager.finalMinOf(YgChartAxis.right);
      final double rightMax = manager.finalMaxOf(YgChartAxis.right);

      final double leftZeroFraction = -leftMin / (leftMax - leftMin);
      final double rightZeroFraction = -rightMin / (rightMax - rightMin);

      expect(leftZeroFraction, closeTo(rightZeroFraction, 0.000001));
      expect(rightMin, lessThanOrEqualTo(-2.0));
      expect(rightMax, greaterThanOrEqualTo(4.0));
      expect(leftMax, greaterThanOrEqualTo(8.0));
    });

    test('axis animates between ranges', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[0.0, 5.0, 10.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);
      final double oldMax = manager.currentMaxOf(YgChartAxis.left);

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[0.0, 50.0, 100.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.5);
      final double newMax = manager.finalMaxOf(YgChartAxis.left);
      expect(manager.currentMaxOf(YgChartAxis.left), closeTo((oldMax + newMax) / 2, 0.000001));

      manager.applyAnimationValue(1.0);
      expect(manager.currentMaxOf(YgChartAxis.left), newMax);
    });

    test('new band series fades in at its values and bounds', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[buildBandSeries()],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('band'), <double>[22.0, 23.0, 24.0]);
      expect(manager.currentLowerValuesOf('band'), <double>[21.0, 22.0, 23.0]);
      expect(manager.currentUpperValuesOf('band'), <double>[23.0, 24.0, 25.0]);
      expect(manager.opacityOf('band'), 0.0);

      manager.applyAnimationValue(1.0);
      expect(manager.opacityOf('band'), 1.0);
    });

    test('band bounds animate between values', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[buildBandSeries()],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[
          buildBandSeries(
            values: <double>[24.0, 25.0, 26.0],
            lowerValues: <double>[23.0, 24.0, 25.0],
            upperValues: <double>[25.0, 26.0, 27.0],
          ),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.5);
      expect(manager.currentValuesOf('band')[0], closeTo(23.0, 0.000001));
      expect(manager.currentLowerValuesOf('band')[0], closeTo(22.0, 0.000001));
      expect(manager.currentUpperValuesOf('band')[0], closeTo(24.0, 0.000001));

      manager.applyAnimationValue(1.0);
      expect(manager.currentLowerValuesOf('band'), <double>[23.0, 24.0, 25.0]);
      expect(manager.currentUpperValuesOf('band'), <double>[25.0, 26.0, 27.0]);
    });

    test('band bounds extend the axis range', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[buildBandSeries()],
        valueCount: 3,
        tickCount: 5,
      );

      // The axis zooms in on the data like for lines, but has to contain
      // the full band, not just the center line.
      expect(manager.finalMinOf(YgChartAxis.left), lessThanOrEqualTo(21.0));
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(25.0));
    });

    test('removed band series fades out in place and is pruned', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a'),
          buildBandSeries(),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[buildSeries(id: 'a')],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.15);
      // The band keeps its position and fades instead of collapsing.
      expect(manager.currentValuesOf('band'), <double>[22.0, 23.0, 24.0]);
      expect(manager.currentLowerValuesOf('band'), <double>[21.0, 22.0, 23.0]);
      expect(manager.opacityOf('band'), greaterThan(0.0));
      expect(manager.opacityOf('band'), lessThan(1.0));

      manager.applyAnimationValue(1.0);
      expect(
        manager.orderedSeries.map((YgChartSeries series) => series.id),
        <String>['a'],
      );
    });

    test('new stepped area series grows in from zero like bars', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[2.0, 4.0, 6.0], type: YgChartSeriesType.steppedArea),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('series'), <double>[0.0, 0.0, 0.0]);
      expect(manager.opacityOf('series'), 1.0);

      manager.applyAnimationValue(1.0);
      expect(manager.currentValuesOf('series'), <double>[2.0, 4.0, 6.0]);
    });

    test('stepped area series keeps the axis anchored at zero', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[20.0, 22.0, 24.0], type: YgChartSeriesType.steppedArea),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      // Unlike a pure line axis the axis does not zoom in on the data, the
      // area needs the zero line as its base.
      expect(manager.finalMinOf(YgChartAxis.left), 0.0);
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(24.0));
    });

    test('removed stepped area series shrinks to zero and is pruned', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a'),
          buildSeries(id: 'b', values: <double>[2.0, 2.0, 2.0], type: YgChartSeriesType.steppedArea),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[buildSeries(id: 'a')],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.5);
      expect(manager.currentValuesOf('b'), <double>[1.0, 1.0, 1.0]);
      expect(manager.opacityOf('b'), 1.0);

      manager.applyAnimationValue(1.0);
      expect(
        manager.orderedSeries.map((YgChartSeries series) => series.id),
        <String>['a'],
      );
    });

    test('NaN gap values do not crash and are excluded from the axis range', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[2.0, double.nan, 8.0]),
          buildSeries(id: 'line', values: <double>[double.nan, 4.0, 12.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      expect(manager.finalMinOf(YgChartAxis.left), 0.0);
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(12.0));
      expect(manager.finalMaxOf(YgChartAxis.left).isFinite, isTrue);
    });

    test('unchanged series keep their values when another update starts', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a', values: <double>[4.0, 6.0, 8.0]),
          buildSeries(id: 'fading', values: <double>[1.0, 1.0, 1.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      // Update only the line's values; the untouched bar must not replay
      // its grow-in from zero and the line must not replay its fade-in.
      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'a', values: <double>[4.0, 6.0, 8.0]),
          buildSeries(id: 'fading', values: <double>[2.0, 2.0, 2.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('a'), <double>[4.0, 6.0, 8.0]);
      expect(manager.opacityOf('fading'), 1.0);
    });

    test('axis with an unchanged target does not replay its previous animation', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[0.0, 4.0, 8.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[0.0, 40.0, 100.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);
      final double settledMax = manager.currentMaxOf(YgChartAxis.left);

      // A value-only change that keeps the same nice axis range must not
      // snap the axis back to the pre-previous range at the animation
      // start, and the labels must not cross-fade to outdated values.
      manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[0.0, 50.0, 100.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      manager.applyAnimationValue(0.0);
      expect(manager.currentMaxOf(YgChartAxis.left), settledMax);
      expect(manager.previousMaxOf(YgChartAxis.left), manager.finalMaxOf(YgChartAxis.left));
    });

    test('changing a band series to a line drops the stale band bounds', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[
          buildBandSeries(
            id: 'temp',
            values: <double>[20.0, 21.0, 22.0],
            lowerValues: <double>[15.0, 16.0, 17.0],
            upperValues: <double>[30.0, 31.0, 32.0],
          ),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);
      expect(manager.finalMaxOf(YgChartAxis.left), greaterThanOrEqualTo(32.0));

      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'temp', values: <double>[20.0, 21.0, 22.0], type: YgChartSeriesType.line),
        ],
        valueCount: 3,
        tickCount: 5,
      );

      // The axis zooms back in on the line instead of keeping the old
      // envelope in its extent.
      expect(manager.finalMaxOf(YgChartAxis.left), lessThan(30.0));
      expect(manager.finalMinOf(YgChartAxis.left), greaterThanOrEqualTo(15.0));
    });

    test('a re-added series returns to its original stacking position', () {
      final YgChartDataManager manager = YgChartDataManager();

      List<YgChartSeries> bothSeries() => <YgChartSeries>[
        buildSeries(id: 'a'),
        buildSeries(id: 'b', values: <double>[2.0, 2.0, 2.0]),
      ];

      manager.updateData(bothSeries(), valueCount: 3, tickCount: 5);
      manager.applyAnimationValue(1.0);

      // Hide 'a' long enough for it to animate out and be pruned.
      manager.updateData(
        <YgChartSeries>[
          buildSeries(id: 'b', values: <double>[2.0, 2.0, 2.0]),
        ],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);
      expect(manager.orderedSeries.map((YgChartSeries series) => series.id), <String>['b']);

      // Re-showing 'a' must restore the original stacking order instead of
      // appending it on top of the stack.
      manager.updateData(bothSeries(), valueCount: 3, tickCount: 5);
      expect(
        manager.orderedSeries.map((YgChartSeries series) => series.id),
        <String>['a', 'b'],
      );
    });

    test('changing the value count rebuilds the tracked state', () {
      final YgChartDataManager manager = YgChartDataManager();

      manager.updateData(
        <YgChartSeries>[buildSeries()],
        valueCount: 3,
        tickCount: 5,
      );
      manager.applyAnimationValue(1.0);

      final bool changed = manager.updateData(
        <YgChartSeries>[
          buildSeries(values: <double>[1.0, 2.0]),
        ],
        valueCount: 2,
        tickCount: 5,
      );

      expect(changed, isTrue);
      expect(manager.valueCount, 2);

      manager.applyAnimationValue(0.0);
      expect(manager.currentValuesOf('series'), <double>[0.0, 0.0]);

      manager.applyAnimationValue(1.0);
      expect(manager.currentValuesOf('series'), <double>[1.0, 2.0]);
    });
  });
}
