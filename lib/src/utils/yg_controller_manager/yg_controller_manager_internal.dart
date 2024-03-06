part of '_yg_controller_manager.dart';

class _YgControllerManagerInternal<S, T extends Listenable> extends YgControllerManager<T> {
  _YgControllerManagerInternal({
    required S state,
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  })  : _state = state,
        _listener = listener,
        _getUserController = getUserController,
        _createController = createController,
        _controller = getUserController() ?? createController(),
        _wasNull = getUserController() == null {
    final T controller = _controller;
    final VoidCallback? listener = this._listener;
    if (listener != null) {
      controller.addListener(listener);
    }
    if (controller is YgAttachable<S>) {
      controller.attach(_state);
    }
  }

  final S _state;
  final T Function() _createController;
  final T? Function() _getUserController;
  final VoidCallback? _listener;

  T _controller;
  bool _wasNull;

  @override
  T get value => _controller;

  void update() {
    final T? userController = _getUserController();
    if (userController == null) {
      if (!_wasNull) {
        _updateController(_createController());
      }
      _wasNull = true;
    } else if (userController != _controller) {
      _updateController(userController);
      _wasNull = false;
    }
  }

  void _updateController(T newController) {
    final VoidCallback? listener = this._listener;
    final T controller = _controller;
    if (controller is YgAttachable) {
      controller.detach();
      controller.attach(_state);
    }
    if (listener != null) {
      _controller.removeListener(listener);
      newController.addListener(listener);
    }
    _controller = newController;
  }

  void dispose() {
    final VoidCallback? listener = this._listener;
    final T controller = _controller;
    if (listener != null) {
      controller.removeListener(listener);
    }

    if (controller is YgAttachable) {
      controller.detach();
    }

    if (_getUserController() != null) {
      return;
    }

    switch (controller) {
      case YgDisposable():
        // Why do i need to tell the compiler what this is??
        (controller as YgDisposable).dispose();
        break;

      // Makes it so we don't need a custom FocusNode and other similar things
      // provided by flutter.
      case ChangeNotifier():
        controller.dispose();
        break;
    }
  }
}
