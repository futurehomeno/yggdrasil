import 'package:flutter/material.dart';

/// A material states controller which notifies you about state changes.
class YgMaterialStatesControllerWithChangeCallback<T extends Enum> extends MaterialStatesController {
  YgMaterialStatesControllerWithChangeCallback({
    required this.onStateChange,
  });

  final void Function(MaterialState state, bool add) onStateChange;

  @override
  void update(MaterialState state, bool add) {
    super.update(state, add);
    onStateChange(state, add);
  }
}
