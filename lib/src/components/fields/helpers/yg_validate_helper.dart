import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';

import '../enums/_enums.dart';

// TODO(Tim): should maybe be updated / split to allow adding certain logic to non form fields as well.
/// Helper for our custom validation logic.
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

  /// Maps our [YgAutoValidate] to the flutter equivalent.
  ///
  /// Maps [YgAutoValidate.onComplete] to [AutovalidateMode.disabled] as the
  /// [YgAutoValidate.onComplete] is implemented by us and not flutter.
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

  /// Maps the [TextInputAction] to [YgCompleteAction].
  ///
  /// Should be used to get the default [YgCompleteAction], should be
  /// overridable by the user.
  static YgCompleteAction mapTextInputAction(TextInputAction textInputAction) {
    if (textInputAction == TextInputAction.next) {
      return YgCompleteAction.focusNext;
    } else if (textInputAction == TextInputAction.previous) {
      return YgCompleteAction.focusPrevious;
    }

    return YgCompleteAction.unfocus;
  }

  /// Combines a list of [FormFieldValidator]s in to one.
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

  /// The key used to do validation.
  final FormFieldKey<T> _key;

  /// The validation mode of the field.
  final YgAutoValidate _autoValidate;

  /// The user specified onFocusChanged handler.
  final ValueChanged<bool>? _onFocusChanged;

  /// The action to execute when the user finishes editing a field.
  final YgCompleteAction _completeAction;

  /// The user specified
  final VoidCallback? _onEditingComplete;

  /// Handler for the field focuses changes.
  void onFocusChanged(bool hasFocus) {
    if (!hasFocus && _autoValidate == YgAutoValidate.onComplete) {
      _key.validate();
    }

    _onFocusChanged?.call(hasFocus);
  }

  /// Handler for when the user finishes editing a field.
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
