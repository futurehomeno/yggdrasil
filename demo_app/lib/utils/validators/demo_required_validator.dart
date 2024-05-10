import 'demo_field_validator.dart';

/// Validates the input is not null or an empty string.
class DemoRequiredValidator extends DemoTextValidator {
  const DemoRequiredValidator({
    required this.requiredError,
  });

  /// The error shown when the input is null or an empty string.
  final String? requiredError;

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return requiredError;
    }

    return null;
  }
}
