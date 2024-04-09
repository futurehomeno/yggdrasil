import 'package:flutter/material.dart';

/// A convenience method for a GlobalKey with a FormState.
class FormKey extends LabeledGlobalKey<FormState> {
  FormKey({
    String? debugLabel,
  }) : super(debugLabel);

  /// Validates every [FormField] that is a descendant of this [Form], and returns true if there are no errors.
  ///
  /// The form will rebuild to report the results.
  bool validate() => currentState?.validate() ?? false;
}
