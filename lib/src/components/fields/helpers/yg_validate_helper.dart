import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';

import '../enums/yg_complete_action.dart';

class YgValidateHelper<T> {
  const YgValidateHelper({
    required FormFieldKey<T> key,
    required YgAutoValidate autoValidate,
    required ValueChanged<bool>? onFocusChanged,
    required YgCompleteAction completeAction,
    required void Function()? onEditingComplete,
  })  : _key = key,
        _autoValidate = autoValidate,
        _onEditingComplete = onEditingComplete,
        _completeAction = completeAction,
        _onFocusChanged = onFocusChanged;

  static AutovalidateMode mapAutoValidate(YgAutoValidate autoValidate) {
    switch (autoValidate) {
      case YgAutoValidate.onComplete:
      case YgAutoValidate.disabled:
        return AutovalidateMode.disabled;
      case YgAutoValidate.onUserInteraction:
        return AutovalidateMode.onUserInteraction;
      case YgAutoValidate.always:
        return AutovalidateMode.always;
    }
  }

  static YgCompleteAction mapTextInputAction(TextInputAction textInputAction) {
    if (textInputAction == TextInputAction.next) {
      return YgCompleteAction.focusNext;
    } else if (textInputAction == TextInputAction.previous) {
      return YgCompleteAction.focusPrevious;
    }

    return YgCompleteAction.unfocus;
  }

  static FormFieldValidator<T> combineValidators<T>(List<FormFieldValidator<T>>? validators) {
    return (T? value) {
      if (validators == null || validators.isEmpty) {
        return null;
      }

      for (final FormFieldValidator<T> validator in validators) {
        final String? error = validator(value);

        if (error != null) {
          return error;
        }
      }

      return null;
    };
  }

  final FormFieldKey<T> _key;
  final YgAutoValidate _autoValidate;
  final ValueChanged<bool>? _onFocusChanged;
  final YgCompleteAction _completeAction;
  final VoidCallback? _onEditingComplete;

  void onFocusChanged(bool hasFocus) {
    if (!hasFocus && _autoValidate == YgAutoValidate.onComplete) {
      _key.validate();
    }

    _onFocusChanged?.call(hasFocus);
  }

  void onEditingComplete() {
    final VoidCallback? onEditingComplete = this._onEditingComplete;

    if (_autoValidate == YgAutoValidate.onComplete && !_key.validate()) {
      return;
    }

    if (onEditingComplete != null) {
      onEditingComplete();

      return;
    }

    final BuildContext? context = _key.currentContext;

    if (context == null) {
      return;
    }

    final FocusScopeNode focusScope = FocusScope.of(context);

    if (_completeAction == YgCompleteAction.focusNext) {
      focusScope.nextFocus();
    } else if (_completeAction == YgCompleteAction.focusPrevious) {
      focusScope.previousFocus();
    } else {
      focusScope.unfocus();
    }
  }
}
