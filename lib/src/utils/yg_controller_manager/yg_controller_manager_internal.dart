part of '_yg_controller_manager.dart';

/// Implementation of [YgControllerManager].
///
/// Split in to a separate file to not expose the dispose method which is
/// handled internally by [YgControllerManagerMixin].
class _YgControllerManagerInternal<S, T extends Listenable> extends YgControllerManager<T> {
  _YgControllerManagerInternal({
    required S state,
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  })  : _state = state,
        _listener = listener,
        _getUserController = getUserController,
        _createController = createController {
    final T? userController = getUserController();
    if (userController == null) {
      _wasNull = true;
      _controller = createController();
    } else {
      _controller = userController;
    }

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

  late T _controller;
  late bool _wasNull;

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
      controller.removeListener(listener);
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
