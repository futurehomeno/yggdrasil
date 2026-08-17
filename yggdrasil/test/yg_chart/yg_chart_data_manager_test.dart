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
    }) {
      return YgChartSeries(
        id: id,
        label: id,
        values: values,
        unit: 'kWh',
        type: type,
        axis: axis,
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
