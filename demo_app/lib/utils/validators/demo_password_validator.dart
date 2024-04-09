import 'demo_combined_validator.dart';
import 'demo_field_validator.dart';
import 'demo_min_length_validator.dart';

/// Validates that a password is at least 8 characters long.
class DemoPasswordValidator extends DemoCombinedValidator<String?> {
  DemoPasswordValidator({
    required this.passwordTooShortError,
  });

  /// The error shown when the password is shorter than 8 characters.
  final String passwordTooShortError;

  @override
  late final List<DemoTextValidator> validators = <DemoTextValidator>[
    DemoMinLengthValidator(
      min: 8,
      tooShortError: passwordTooShortError,
    ),
  ];
}
