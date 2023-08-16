import 'package:flutter/widgets.dart';

/// A convenience method for a GlobalKey with a FormFieldState.
class FormFieldKey<T> extends LabeledGlobalKey<FormFieldState<T>> {
  FormFieldKey({
    String? debugLabel,
  }) : super(debugLabel);

  /// The current value of the form field.
  T? get value => currentState?.value;
}
