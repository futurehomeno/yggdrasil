import 'package:yggdrasil/yggdrasil.dart';

/// Validates the value is not null.
///
/// !--- IMPORTANT ---
/// This does not check if the value it self is "empty". When checking if a
/// text field is empty, use the [RequiredValidator] instead.

class NullValidator extends YgFieldValidator<dynamic> {
  const NullValidator({
    required this.nullError,
  });

  /// The error shown when the value is null.
  final String nullError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, dynamic value) {
    if (value == null) {
      return nullError;
    }

    return null;
  }
}
