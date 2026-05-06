import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/body/controller/_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller.dart';

/// Controller which manages the current state of the [YgLayoutBody].
class YgLayoutBodyController extends ValueNotifier<YgLayoutBodyControllerValue> {
  YgLayoutBodyController({
    bool loading = false,
  }) : super(
         YgLayoutBodyControllerValue(
           loading: loading,
           extendAfter: 0,
           extendBefore: 0,
         ),
       );

  YgLayoutHeaderController? _parentController;

  final Set<ValueChanged<double>> _scrollListeners = <ValueChanged<double>>{};

  bool get loading => value.loading;
  set loading(bool newValue) {
    value = value.copyWith(
      loading: newValue,
    );
  }

  double get extendBefore => value.extendBefore;
  set extendBefore(double newValue) {
    value = value.copyWith(
      extendBefore: newValue,
    );
  }

  double get extendAfter => value.extendAfter;
  set extendAfter(double newValue) {
    value = value.copyWith(
      extendAfter: newValue,
    );
  }

  void attach(YgLayoutHeaderController parentController) {
    assert(
      _parentController == null,
      'YgLayoutBodyController is already attached to a parent controller',
    );

    _parentController = parentController;
  }

  void detach() {
    _parentController = null;
  }

  double getDesiredOffsetFromDelta(double delta) {
    final YgLayoutHeaderController? parent = _parentController;
    if (parent == null) {
      return 0;
    }

    final double collapsibleHeight = parent.collapsibleHeight;
    final double offset = parent.headerOffsetFraction.value;
    final double fractionalDelta = delta / collapsibleHeight;
    final double newValue = (offset + fractionalDelta).clamp(0, 1);
    final double target = newValue < 0.5 ? 0 : 1;
    final double difference = target - newValue;

    return difference * collapsibleHeight;
  }

  void handleScrollMetricsNotification(ScrollMetricsNotification notification) {
    value = value.copyWith(
      extendAfter: notification.metrics.extentAfter,
      extendBefore: notification.metrics.extentBefore,
    );
  }

  void handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    final double delta = notification.scrollDelta ?? 0;
    final double previousPixels = metrics.pixels - delta;

    // Only forward the scroll delta to header listeners while both the start
    // and end of the movement lie inside the normal scroll range. Overscroll
    // deltas (from a pull-to-refresh gesture or a bouncing spring-back) would
    // otherwise accumulate into the header offset and hide the header on
    // release.
    final bool inRange = _isInRange(previousPixels, metrics) && _isInRange(metrics.pixels, metrics);
    if (inRange) {
      for (final ValueChanged<double> listener in _scrollListeners) {
        listener(delta);
      }
    }

    value = value.copyWith(
      extendAfter: metrics.extentAfter,
      extendBefore: metrics.extentBefore,
    );
  }

  static bool _isInRange(double pixels, ScrollMetrics metrics) {
    return pixels >= metrics.minScrollExtent && pixels <= metrics.maxScrollExtent;
  }

  void addScrollListener(ValueChanged<double> listener) {
    _scrollListeners.add(listener);
  }

  void removeScrollListener(ValueChanged<double> listener) {
    _scrollListeners.remove(listener);
  }
}
