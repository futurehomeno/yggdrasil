import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_body_controller_provider.dart';

class YgLayoutController extends ChangeNotifier {
  YgLayoutController({
    required TickerProvider vsync,
    int initialView = 0,
  })  : _headerOffsetController = AnimationController(
          vsync: vsync,
        ),
        _activeView = initialView {
    _headerOffsetController.addListener(notifyListeners);
  }

  static YgLayoutController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<YgLayoutBodyControllerProvider>()?.controller;
  }

  final AnimationController _headerOffsetController;
  final List<YgLayoutScrollEventListener> _listeners = <YgLayoutScrollEventListener>[];

  Animation<double> get headerOffset => _headerOffsetController;

  int _activeView;
  double _collapsibleHeight = 0;
  bool _resettable = false;

  void handleScrollNotification(int index, ScrollNotification notification) {
    switch (notification) {
      case ScrollEndNotification():
        _handleScrollEnd(index);
      case ScrollUpdateNotification():
        _handleScrollUpdate(index, notification);
    }
  }

  void _handleScrollUpdate(int index, ScrollUpdateNotification notification) {
    if (index != _activeView) {
      return;
    }

    if (_collapsibleHeight <= 0) {
      _headerOffsetController.value = 0;

      return;
    }

    final double delta = notification.scrollDelta ?? 0;
    final double fractionalDelta = delta / _collapsibleHeight;
    final double newValue = (_headerOffsetController.value + fractionalDelta).clamp(0, 1);

    if (newValue != _headerOffsetController.value) {
      _resettable = newValue != 0;
      _headerOffsetController.value = newValue;
    }
  }

  void _handleScrollEnd(int index) {
    if (index != _activeView) {
      return;
    }

    final double currentHeaderPosition = _headerOffsetController.value;

    if (currentHeaderPosition <= 0 || currentHeaderPosition >= 1) {
      return;
    }

    final double target;

    if (currentHeaderPosition < 0.5) {
      target = 0;
      _resettable = false;
    } else {
      target = 1;
    }

    final double difference = target - currentHeaderPosition;
    final double offset = difference * _collapsibleHeight;

    _headerOffsetController.animateTo(
      target,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
    );

    // Do this in a micro task because scroll needs to finish before we can move
    // the scroll controller to a different position.
    scheduleMicrotask(() {
      _emitEvent(YgLayoutScrollEvent(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
        offset: offset,
        target: _activeView,
      ));
    });
  }

  void _emitEvent(YgLayoutScrollEvent event) {
    for (final YgLayoutScrollEventListener listener in _listeners) {
      listener(event);
    }
  }

  void addScrollEventListener(YgLayoutScrollEventListener listener) {
    _listeners.add(listener);
  }

  void removeScrollEventListener(YgLayoutScrollEventListener listener) {
    _listeners.remove(listener);
  }

  void setActiveView(int index) {
    _activeView = index;
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
    print('setCollapsibleHeight: $newHeight');
    _collapsibleHeight = newHeight;
  }

  @override
  void dispose() {
    _headerOffsetController.removeListener(notifyListeners);
    _headerOffsetController.dispose();
    _listeners.clear();
    super.dispose();
  }
}

class YgLayoutScrollEvent {
  const YgLayoutScrollEvent({
    required this.offset,
    required this.target,
    required this.curve,
    required this.duration,
  });

  final double offset;
  final int target;
  final Duration duration;
  final Curve curve;
}

typedef YgLayoutScrollEventListener = void Function(YgLayoutScrollEvent event);
