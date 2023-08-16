import '_validators.dart';

/// A validator that validates string values.
typedef YgTextValidator = YgInputValidator<String>;

/// A validator that validates number values.
typedef YgNumberValidator = YgInputValidator<num>;

/// A validator class.
///
/// Should be extended and override the [validate] method. Should also accept
/// error values. If the error values are common they should be added to
/// [YgDefaultValidatorErrors].
abstract class YgInputValidator<T> {
  const YgInputValidator();

  /// Validates [value].
  ///
  /// Returns a [String] if the validation failed, returns null otherwise.
  String? validate(YgDefaultValidatorErrors defaults, T? value);
}
