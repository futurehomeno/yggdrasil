import 'package:flutter/widgets.dart';

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

  final AnimationController _headerOffsetController;
  final List<YgLayoutScrollEventListener> _listeners = <YgLayoutScrollEventListener>[];

  Animation<double> get headerOffset => _headerOffsetController;

  int _activeView;
  double _movableHeaderHeight = 0;

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

    final double delta = notification.scrollDelta ?? 0;
    final double fractionalDelta = delta / _movableHeaderHeight;

    _headerOffsetController.value += fractionalDelta;
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
    if (currentHeaderPosition > 0.5) {
      target = 1;
    } else {
      target = 0;
    }

    final double difference = target - currentHeaderPosition;
    final double offset = difference * _movableHeaderHeight;

    _emitEvent(YgLayoutScrollEvent(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      offset: offset,
      target: _activeView,
    ));

    _headerOffsetController.animateTo(
      target,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
    );
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
    _headerOffsetController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void setCollapsibleHeight(double newHeight) {
    _movableHeaderHeight = newHeight;
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
