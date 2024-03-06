part of '_yg_controller_manager.dart';

/// Mixing for managing controllers in [StatefulWidget]s.
@optionalTypeArgs
mixin YgControllerManagerMixin<W extends StatefulWidget> on State<W> {
  final List<_YgControllerManagerInternal<State, Listenable>> _managers =
      <_YgControllerManagerInternal<State, Listenable>>[];

  @override
  void didUpdateWidget(covariant W oldWidget) {
    for (final _YgControllerManagerInternal<State<StatefulWidget>, Listenable> manager in _managers) {
      manager.update();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final _YgControllerManagerInternal<State<StatefulWidget>, Listenable> manager in _managers) {
      manager.dispose();
    }
    super.dispose();
  }
}
