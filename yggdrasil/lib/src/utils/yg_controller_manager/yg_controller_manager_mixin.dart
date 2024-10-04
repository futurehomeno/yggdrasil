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
}
