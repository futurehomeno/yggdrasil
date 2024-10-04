part of '_yg_controller_manager.dart';

/// Adds the manageController method to the [YgControllerManagerMixin].
///
/// I hate that this is the only option to add a mixin method that has access to
/// the type of [this], dart plz fix...
extension YgControllerManagerMixinExtension<W extends StatefulWidget, S extends YgControllerManagerMixin<W>> on S {
  /// returns a [YgControllerManager] which manages the controller of type [T].
  YgControllerManager<T> manageController<T extends Listenable>({
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  }) {
    final YgControllerManagerImplementation<S, T> manager = YgControllerManagerImplementation<S, T>(
      createController: createController,
      getUserController: getUserController,
      state: this,
      listener: listener,
    );

    _managers.add(manager);

    return manager;
  }
}
