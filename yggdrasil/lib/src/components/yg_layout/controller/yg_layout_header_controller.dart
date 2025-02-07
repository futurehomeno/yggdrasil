import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller_provider.dart';

typedef LayoutBodyCallback<T> = void Function(int index, T value);

class YgLayoutHeaderController extends ChangeNotifier {
  YgLayoutHeaderController({
    required TickerProvider vsync,
    int initialView = 0,
  })  : _headerOffsetController = AnimationController(
          vsync: vsync,
        ),
        _activeView = initialView {
    _headerOffsetController.addListener(notifyListeners);
    _shadowController = YgLayoutShadowController(this);
    _loadingController = YgLayoutLoadingController(this);
  }

  static YgLayoutHeaderController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgLayoutHeaderControllerProvider>()?.controller;
  }

  late final YgLayoutShadowController _shadowController;
  ValueListenable<bool> get headerShadow => _shadowController;

  late final YgLayoutLoadingController _loadingController;
  ValueListenable<bool> get loading => _loadingController;

  final AnimationController _headerOffsetController;

  final Map<int, YgLayoutBodyController> _viewControllers = <int, YgLayoutBodyController>{};

  Animation<double> get headerOffsetFraction => _headerOffsetController;
  double get _headerOffset => _headerOffsetController.value * _collapsibleHeight;

  int get activeView => _activeView;

  int _activeView;
  double _collapsibleHeight = 0;
  bool _resettable = false;

  /// Desired offset from the current scroll position.
  double get desiredOffset => _desiredOffset;
  double _desiredOffset = 0.0;

  void setActiveView(int index) {
    if (_activeView != index) {
      final YgLayoutBodyController? oldController = _viewControllers[_activeView];
      final YgLayoutBodyController? newController = _viewControllers[index];
      _activeView = index;
      _updateActiveViewController(oldController, newController);
    }
  }

  void resetHeader() {
    if (!_resettable) {
      return;
    }

    _resettable = false;
    _headerOffsetController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void setCollapsibleHeight(double newHeight) {
    _collapsibleHeight = newHeight;
  }

  void registerView(int index, YgLayoutBodyController controller) {
    final YgLayoutBodyController? oldController = _viewControllers[index];
    if (oldController == controller) {
      // No action needed.
      return;
    }

    controller.attach(this);

    _viewControllers[index] = controller;

    if (index == _activeView) {
      _updateActiveViewController(oldController, controller);
    }
  }

  void unregisterView(int index) {
    final YgLayoutBodyController? oldController = _viewControllers.remove(index);
    if (oldController == null) {
      return;
    }

    oldController.detach();

    if (index == _activeView) {
      _updateActiveViewController(oldController, null);
    }
  }

  void _updateActiveViewController(
    YgLayoutBodyController? oldController,
    YgLayoutBodyController? newController,
  ) {
    if (oldController != null) {
      oldController.removeScrollDeltaListener(_handleScrollDelta);
      oldController.removeScrollMetricsListener(_shadowController._handleMetricsUpdate);
    }
    if (newController != null) {
      newController.addScrollDeltaListener(_handleScrollDelta);
      newController.addScrollMetricsListener(_shadowController._handleMetricsUpdate);
    }
  }

  void _handleScrollDelta(double delta) {
    if (_collapsibleHeight <= 0) {
      _headerOffsetController.value = 0;

      return;
    }

    final double fractionalDelta = delta / _collapsibleHeight;
    final double newValue = (_headerOffsetController.value + fractionalDelta).clamp(0, 1);

    if (newValue != _headerOffsetController.value) {
      _resettable = newValue != 0;
      _headerOffsetController.value = newValue;
    }

    final double target = newValue < 0.5 ? 0 : 1;
    final double difference = target - newValue;

    _desiredOffset = difference * _collapsibleHeight;
  }

  @override
  void dispose() {
    _headerOffsetController.removeListener(notifyListeners);
    _headerOffsetController.dispose();
    super.dispose();
  }
}

class YgLayoutShadowController extends ValueNotifier<bool> {
  YgLayoutShadowController(YgLayoutHeaderController parent)
      : _parent = parent,
        super(false);

  final YgLayoutHeaderController _parent;

  void _handleMetricsUpdate(ScrollMetrics metrics) {
    value = (_parent._headerOffset + 0.01) < metrics.extentBefore;
  }
}

class YgLayoutLoadingController extends ValueNotifier<bool> {
  YgLayoutLoadingController(YgLayoutHeaderController parent)
      : _parent = parent,
        super(false);

  final YgLayoutHeaderController _parent;
}

class YgLayoutBodyController extends ChangeNotifier {
  YgLayoutBodyController({
    bool loading = false,
  }) : loading = ValueNotifier<bool>(loading);

  YgLayoutHeaderController? _parentController;

  final ValueNotifier<bool> loading;
  final Set<ValueChanged<ScrollMetrics>> _metricsListeners = <ValueChanged<ScrollMetrics>>{};
  final Set<ValueChanged<double>> _deltaListeners = <ValueChanged<double>>{};

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
    for (final ValueChanged<ScrollMetrics> listener in _metricsListeners) {
      listener(notification.metrics);
    }
  }

  void handleScrollUpdateNotification(ScrollUpdateNotification notification) {
    for (final ValueChanged<double> listener in _deltaListeners) {
      listener(notification.scrollDelta ?? 0);
    }
    for (final ValueChanged<ScrollMetrics> listener in _metricsListeners) {
      listener(notification.metrics);
    }
  }

  void addScrollDeltaListener(ValueChanged<double> listener) {
    _deltaListeners.add(listener);
  }

  void removeScrollDeltaListener(ValueChanged<double> listener) {
    _deltaListeners.remove(listener);
  }

  void addScrollMetricsListener(ValueChanged<ScrollMetrics> listener) {
    _metricsListeners.add(listener);
  }

  void removeScrollMetricsListener(ValueChanged<ScrollMetrics> listener) {
    _metricsListeners.remove(listener);
  }
}
