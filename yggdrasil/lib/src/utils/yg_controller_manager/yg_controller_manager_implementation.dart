part of '_yg_controller_manager.dart';

/// Implementation of [YgControllerManager].
///
/// Split in to a separate file to not expose the dispose method which is
/// handled internally by [YgControllerManagerMixin].
class YgControllerManagerImplementation<S, T extends Listenable> extends YgControllerManager<T> {
  YgControllerManagerImplementation({
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

    if (controller is YgAttachable) {
      // We have to try catch because we can't check whether the state is the
      // expected value for YgAttachable. This is because YgAttachable might
      // expect an interface which state implements, but because we can not
      // access the type argument of the YgAttachable instance, we can not check
      // whether state implements it. If there is some sort of way to access the
      // type argument of the YgAttachable we should do the type check instead,
      // and can remove this try catch.
      try {
        controller.attach(_state);
        _attached = true;
      } catch (e) {
        _attached = false;
      }
    }
  }

  final S _state;
  final T Function() _createController;
  final T? Function() _getUserController;
  final VoidCallback? _listener;

  late T _controller;
  late bool _wasNull;
  bool _attached = false;

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
    if (controller is YgAttachable && _attached) {
      controller.detach();
    }
    if (newController is YgAttachable) {
      try {
        newController.attach(_state);
        _attached = true;
      } catch (e) {
        _attached = false;
      }
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

    if (controller is YgAttachable && _attached) {
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

class _T<T> {
  const _T();
}
