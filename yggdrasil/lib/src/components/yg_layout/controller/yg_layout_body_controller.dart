part of 'yg_layout_header_controller.dart';

class YgLayoutBodyController extends ValueNotifier<YgLayoutBodyState> {
  YgLayoutBodyController({
    bool loading = false,
  }) : super(
          YgLayoutBodyState(
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

    final double headerOffset = parent._headerOffsetController.value;
    final double collapsibleHeight = parent._collapsibleHeight;

    final double fractionalDelta = delta / collapsibleHeight;
    final double newValue = (headerOffset + fractionalDelta).clamp(0, 1);
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

class YgLayoutBodyState {
  const YgLayoutBodyState({
    required this.loading,
    required this.extendAfter,
    required this.extendBefore,
  });

  final bool loading;
  final double extendBefore;
  final double extendAfter;

  YgLayoutBodyState copyWith({
    bool? loading,
    double? extendBefore,
    double? extendAfter,
  }) {
    return YgLayoutBodyState(
      loading: loading ?? this.loading,
      extendBefore: extendBefore ?? this.extendBefore,
      extendAfter: extendAfter ?? this.extendAfter,
    );
  }

  @override
  int get hashCode => Object.hash(
        loading,
        extendBefore,
        extendAfter,
      );

  @override
  bool operator ==(Object other) =>
      other is YgLayoutBodyState &&
      other.loading == loading &&
      other.extendBefore == extendBefore &&
      other.extendAfter == extendAfter;
}
