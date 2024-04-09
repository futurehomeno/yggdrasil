part of '_yg_controller_manager.dart';

/// A class that can be attached to another class of type [T].
abstract class YgAttachable<T> implements Listenable {
  @protected
  void attach(T state);

  @protected
  void detach();
}
