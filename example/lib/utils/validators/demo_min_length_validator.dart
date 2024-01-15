import 'demo_field_validator.dart';

/// Validates a value is not bellow [min] length.
class DemoMinLengthValidator extends DemoTextValidator {
  const DemoMinLengthValidator({
    required this.min,
    required this.tooShortError,
  });

  /// The minimum allowed length of the validated text.
  final int min;

  /// The error shown when the text is shorter than [min].
  final String tooShortError;

  @override
  String? validate(String? value) {
    if (value == null) {
      return null;
    }

    if (value.length < min) {
      return tooShortError;
    }

    return null;
  }
}
