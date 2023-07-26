import 'package:yggdrasil/yggdrasil.dart';

class ZwaveValidator extends TextValidator {
  ZwaveValidator({
    this.error,
  });

  final String? error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    // Length can only be one of these three values exactly.
    if (value != '1' && value != '2' && value != '4') {
      return error ?? defaults.invalidZwaveParameterLength;
    }

    return null;
  }
}
