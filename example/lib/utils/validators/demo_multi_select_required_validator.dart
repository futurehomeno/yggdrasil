import 'demo_field_validator.dart';

/// Validates at least one value is selected.
class DemoMultiSelectRequiredValidator extends DemoFieldValidator<Set<dynamic>?> {
  const DemoMultiSelectRequiredValidator({
    required this.requiredError,
  });

  /// Error shown when not at least one item is selected.
  final String requiredError;

  @override
  String? validate(Set<dynamic>? value) {
    if (value == null || value.isEmpty) {
      return requiredError;
    }

    return null;
  }
}
