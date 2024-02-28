// ignore_for_file: avoid-dynamic, prefer-async-await

part of 'yg_snack_bar_manager.dart';

class YgSnackBarFuture implements Future<void> {
  const YgSnackBarFuture._({
    required Future<void> parent,
    required VoidCallback hideCallback,
  })  : _parent = parent,
        _hideCallback = hideCallback;

  final Future<void> _parent;
  final VoidCallback _hideCallback;

  @override
  Stream<void> asStream() {
    return _parent.asStream();
  }

  @override
  Future<void> catchError(Function onError, {bool Function(Object)? test}) {
    return _parent.catchError(onError, test: test);
  }

  @override
  Future<R> then<R>(FutureOr<R> Function(void value) onValue, {Function? onError}) {
    return _parent.then<R>(onValue, onError: onError);
  }

  @override
  Future<void> timeout(Duration timeLimit, {FutureOr<void> Function()? onTimeout}) {
    return _parent.timeout(timeLimit, onTimeout: onTimeout);
  }

  @override
  Future<void> whenComplete(dynamic Function() action) {
    return _parent.whenComplete(action);
  }

  /// Hides the snackbar or if it isn't currently on screen removes it from the
  /// queue.
  void hide() => _hideCallback();
}
