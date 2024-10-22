part of '_yg_controller_manager.dart';

/// Mixing for managing controllers in [StatefulWidget]s.
@optionalTypeArgs
mixin YgControllerManagerMixin<W extends StatefulWidget> on State<W> {
  final List<YgControllerManagerImplementation<State, Listenable>> _managers =
      <YgControllerManagerImplementation<State, Listenable>>[];

  @override
  void didUpdateWidget(covariant W oldWidget) {
    for (final YgControllerManagerImplementation<State<StatefulWidget>, Listenable> manager in _managers) {
      manager.update();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final YgControllerManagerImplementation<State<StatefulWidget>, Listenable> manager in _managers) {
      manager.dispose();
    }
    super.dispose();
  }

  /// returns a [YgControllerManager] which manages the controller of type [T].
  ///
  /// This method is different from [manageController] because it allows you to
  /// specify your own type argument for the state, which might be required if
  /// your controller implements [YgAttachable] with a generic interface type
  /// argument.
  YgControllerManager<T> manageControllerWithType<T extends Listenable, S extends State>({
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  }) {
    final YgControllerManagerImplementation<S, T> manager = YgControllerManagerImplementation<S, T>(
      createController: createController,
      getUserController: getUserController,
      state: this as S,
      listener: listener,
    );

    _managers.add(manager);

    return manager;
  }
}
