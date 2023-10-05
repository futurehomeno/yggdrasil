import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/_fields.dart';

// TODO(DEV-1916): should maybe be updated / split to allow adding certain logic to non form fields as well.
/// Helper for our custom validation logic.
class YgValidateHelper<T> {
  const YgValidateHelper({
    required FormFieldKey<T> key,
    required YgAutovalidate autoValidate,
    required ValueChanged<bool>? onFocusChanged,
    required YgCompleteAction completeAction,
    required void Function()? onEditingComplete,
  })  : _key = key,
        _autoValidate = autoValidate,
        _onEditingComplete = onEditingComplete,
        _completeAction = completeAction,
        _onFocusChanged = onFocusChanged;

  /// Maps our [YgAutovalidate] to the flutter equivalent.
  ///
  /// Maps [YgAutovalidate.onComplete] to [AutovalidateMode.disabled] as the
  /// [YgAutovalidate.onComplete] is implemented by us and not flutter.
  static AutovalidateMode mapAutoValidate(YgAutovalidate autoValidate) {
    switch (autoValidate) {
      case YgAutovalidate.onComplete:
      case YgAutovalidate.disabled:
        return AutovalidateMode.disabled;
      case YgAutovalidate.onUserInteraction:
        return AutovalidateMode.onUserInteraction;
      case YgAutovalidate.always:
        return AutovalidateMode.always;
    }
  }

  /// Maps the [TextInputAction] to [YgCompleteAction].
  ///
  /// Should be used to get the default [YgCompleteAction], should be
  /// overridable by the user.
  static YgCompleteAction mapTextInputAction(TextInputAction textInputAction) {
    switch (textInputAction) {
      case TextInputAction.next:
        return YgCompleteAction.focusNext;
      case TextInputAction.previous:
        return YgCompleteAction.focusPrevious;
      default:
        return YgCompleteAction.unfocus;
    }
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
  final YgAutovalidate _autoValidate;

  /// The user specified onFocusChanged handler.
  final ValueChanged<bool>? _onFocusChanged;

  /// The action to execute when the user finishes editing a field.
  final YgCompleteAction _completeAction;

  /// The user specified
  final VoidCallback? _onEditingComplete;

  /// Handler for the field focuses changes.
  void onFocusChanged(bool hasFocus) {
    if (!hasFocus && _autoValidate == YgAutovalidate.onComplete) {
      _key.validate();
    }

    _onFocusChanged?.call(hasFocus);
  }

  /// Handler for when the user finishes editing a field.
  void onEditingComplete() {
    final VoidCallback? onEditingComplete = this._onEditingComplete;

    if (_autoValidate == YgAutovalidate.onComplete && !_key.validate()) {
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
