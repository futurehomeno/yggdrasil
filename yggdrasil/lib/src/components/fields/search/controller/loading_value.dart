import 'package:flutter/widgets.dart';

/// Manages the loading value of a YgSearchController.
class LoadingValue extends ValueNotifier<bool> {
  LoadingValue() : super(false);

  bool _isLoadingResults = false;
  bool get isLoadingResults => _isLoadingResults;
  set isLoadingResults(bool isLoading) {
    _isLoadingResults = isLoading;
    _update();
  }

  bool _isLoadingSelectedResult = false;
  bool get isLoadingSelectedResult => _isLoadingSelectedResult;
  set isLoadingSelectedResult(bool isLoading) {
    _isLoadingSelectedResult = isLoading;
    _update();
  }

  void _update() {
    value = _isLoadingResults || _isLoadingSelectedResult;
  }
}
