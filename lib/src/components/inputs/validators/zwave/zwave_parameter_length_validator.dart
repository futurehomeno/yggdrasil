import 'package:yggdrasil/yggdrasil.dart';

/// Validates the zwave parameter length.
///
/// Makes sure the value is only 1, 2 or 4.
class ZwaveParameterLengthValidator extends YgTextValidator {
  const ZwaveParameterLengthValidator({
    this.invalidZwaveParameterLengthError,
  });

  /// The error shown when the zwave paramter is not 1, 2 or 4.
  ///
  /// Overrides the default error [YgDefaultValidatorErrors.invalidZwaveParameterLength].
  final String? invalidZwaveParameterLengthError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    // Length can only be one of these three values exactly.
    if (value != '1' && value != '2' && value != '4') {
      return invalidZwaveParameterLengthError ?? defaults.invalidZwaveParameterLength;
    }

    return null;
  }
}
