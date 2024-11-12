import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

@optionalTypeArgs
mixin YgCompleteActionStateMixin<T extends StatefulWidget> on State<T> {
  VoidCallback? get onEditingComplete;
  FocusNode get focusNode;
  YgCompleteAction get completeAction;

  void doCompleteAction() {
    final VoidCallback? onEditingComplete = this.onEditingComplete;

    if (onEditingComplete != null) {
      onEditingComplete();

      return;
    }

    switch (completeAction) {
      case YgCompleteAction.focusNext:
        focusNode.nextFocus();
        break;
      case YgCompleteAction.focusPrevious:
        focusNode.previousFocus();
        break;
      case YgCompleteAction.unfocus:
        focusNode.unfocus();
        break;
      case YgCompleteAction.none:
    }
  }
}
