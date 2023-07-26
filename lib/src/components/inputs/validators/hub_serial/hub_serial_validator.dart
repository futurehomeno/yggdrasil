import 'package:yggdrasil/yggdrasil.dart';

class HubSerialValidator extends TextValidator {
  HubSerialValidator({
    this.error,
  });

  final String? error;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    // We only know that the hub serials must be at least 16,
    // cannot be 17, but can be longer than that...
    if (value.length < 16 || value.length == 17) {
      return error ?? defaults.invalidHubSerial(value);
    }

    return null;
  }
}
