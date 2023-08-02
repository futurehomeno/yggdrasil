import 'package:yggdrasil/yggdrasil.dart';

class ZwaveParameterLengthValidator extends YgTextValidator {
  const ZwaveParameterLengthValidator({
    this.invalidZwaveParameterLengthError,
  });

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
