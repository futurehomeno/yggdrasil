import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/body/controller/_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/layout/controller/yg_layout_header_controller.dart';

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
    for (final ValueChanged<double> listener in _scrollListeners) {
      listener(notification.scrollDelta ?? 0);
    }
    value = value.copyWith(
      extendAfter: notification.metrics.extentAfter,
      extendBefore: notification.metrics.extentBefore,
    );
  }

  void addScrollListener(ValueChanged<double> listener) {
    _scrollListeners.add(listener);
  }

  void removeScrollListener(ValueChanged<double> listener) {
    _scrollListeners.remove(listener);
  }
}
