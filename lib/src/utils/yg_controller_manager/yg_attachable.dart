part of '_yg_controller_manager.dart';

abstract class YgAttachable<T> implements Listenable {
  @protected
  void attach(T state);

  @protected
  void detach();
}
