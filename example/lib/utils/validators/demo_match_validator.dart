import 'package:flutter/widgets.dart';

import 'demo_field_validator.dart';

/// Validates that the value of the field is equal to the value of another field.
class DemoMatchValidator<T> extends DemoFieldValidator<T?> {
  const DemoMatchValidator({
    required this.otherFieldKey,
    required this.error,
  });

  /// The key of the other field this fields value should be equal to.
  final GlobalKey<FormFieldState<T?>> otherFieldKey;

  /// The error shown when the value of this field is not the same as the value
  /// of the [otherFieldKey].
  final String error;

  @override
  String? validate(T? value) {
    final T? otherValue = otherFieldKey.currentState?.value;

    if (otherValue != value) {
      return error;
    }

    return null;
  }
}
