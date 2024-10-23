part of '_yg_controller_manager.dart';

/// Manages a controller.
///
/// Manages the lifecycle of a controller. Keeps track of user the supplied
/// controller and creates and manages its own controller if the user has not
/// supplied any controller.
abstract class YgControllerManager<T extends Listenable> {
  factory YgControllerManager({
    required Object state,
    required T Function() createController,
    required T? Function() getUserController,
    void Function()? listener,
  }) = _YgControllerManagerInternal<T>;

  T get value;
}
