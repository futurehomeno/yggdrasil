import 'demo_field_validator.dart';

/// Validates the value is not null.
class DemoNullValidator extends DemoFieldValidator<dynamic> {
  const DemoNullValidator({
    required this.nullError,
  });

  /// The error shown when the value is null.
  final String nullError;

  @override
  String? validate(dynamic value) {
    if (value == null) {
      return nullError;
    }

    return null;
  }
}
