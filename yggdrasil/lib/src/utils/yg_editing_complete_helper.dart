import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

abstract class YgEditingCompleteHelper {
  YgEditingCompleteHelper._();

  static void onComplete({
    required VoidCallback? onEditingComplete,
    required FocusNode focusNode,
    required YgCompleteAction completeAction,
  }) {
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
