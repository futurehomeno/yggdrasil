import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/body/controller/_controller.dart';

import 'yg_layout_header_controller_value.dart';

/// Controller which manages the current state of the [YgLayout] header.
class YgLayoutHeaderController extends ValueNotifier<YgLayoutHeaderControllerValue> {
  YgLayoutHeaderController({
    required TickerProvider vsync,
    int initialView = 0,
  })  : _headerOffsetController = AnimationController(
          vsync: vsync,
        ),
        _activeView = initialView,
        super(
          const YgLayoutHeaderControllerValue(
            shadow: false,
            loading: false,
          ),
        ) {
    _headerOffsetController.addListener(notifyListeners);
  }

  final Map<int, YgLayoutBodyController> _viewControllers = <int, YgLayoutBodyController>{};
  final AnimationController _headerOffsetController;

  Animation<double> get headerOffsetFraction => _headerOffsetController;

  int _activeView;
  int get activeView => _activeView;

  double _collapsibleHeight = 0;
  double get collapsibleHeight => _collapsibleHeight;

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
      oldController.removeScrollListener(_handleScrollDelta);
      oldController.removeListener(_updateValue);
    }
    if (newController != null) {
      newController.addScrollListener(_handleScrollDelta);
      newController.addListener(_updateValue);
    }
    _updateValue();
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

  void _updateValue() {
    final YgLayoutBodyControllerValue? activeState = _viewControllers[_activeView]?.value;
    if (activeState == null) {
      value = const YgLayoutHeaderControllerValue(
        shadow: false,
        loading: false,
      );

      return;
    }

    final double offset = _headerOffsetController.value * _collapsibleHeight;
    final bool showShadow = (offset + 0.01) < activeState.extendBefore;

    value = YgLayoutHeaderControllerValue(
      shadow: showShadow,
      loading: activeState.loading,
    );
  }

  @override
  void dispose() {
    _headerOffsetController.removeListener(notifyListeners);
    _headerOffsetController.dispose();
    super.dispose();
  }
}
