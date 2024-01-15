import 'package:flutter/foundation.dart';

import 'demo_validator.dart';

/// A validator that validates string values.
typedef DemoTextValidator = DemoFieldValidator<String?>;

/// A validator that validates number values.
typedef DemoNumberValidator = DemoFieldValidator<num?>;

/// A validator class that is used in UI places requiring to have a displayable text.
abstract class DemoFieldValidator<T extends Object?> extends DemoValidator<T, String> {
  const DemoFieldValidator();

  /// Implements the [call] interface to allow passing the class directly to a form field.
  ///
  /// Preferred over the letting the extending classes override
  /// [call] for readability.
  @nonVirtual
  String? call(T value) => validate(value);

  /// Validates the [value].
  ///
  /// Returns a [String] if the validation failed.
  /// Returns `null` otherwise.
  @override
  String? validate(T value);
}
