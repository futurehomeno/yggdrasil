part of '_yg_controller_manager.dart';

/// Mixing for managing controllers in [StatefulWidget]s.
@optionalTypeArgs
mixin YgControllerManagerMixin<W extends StatefulWidget> on State<W> {
  final List<_YgControllerManagerInternal<Listenable>> _managers = <_YgControllerManagerInternal<Listenable>>[];

  @override
  void didUpdateWidget(covariant W oldWidget) {
    for (final _YgControllerManagerInternal<Listenable> manager in _managers) {
      manager.update();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final _YgControllerManagerInternal<Listenable> manager in _managers) {
      manager.dispose();
    }
    super.dispose();
  }

  /// returns a [YgControllerManager] which manages the controller of type [T].
  YgControllerManager<T> manageController<T extends Listenable>({
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  }) {
    final _YgControllerManagerInternal<T> manager = _YgControllerManagerInternal<T>(
      createController: createController,
      getUserController: getUserController,
      state: this,
      listener: listener,
    );

    _managers.add(manager);

    return manager;
  }
}
