import 'demo_field_validator.dart';

/// Validates the value is not null.
///
/// !--- IMPORTANT ---
/// This does not check if the value it self is "empty". When checking if a
/// text field is empty, use the [RequiredValidator] instead.
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
