import 'package:yggdrasil/yggdrasil.dart';

class HubSerialValidator extends YgTextValidator {
  const HubSerialValidator({
    this.invalidHubSerialError,
  });

  final String? invalidHubSerialError;

  @override
  String? validate(YgDefaultValidatorErrors defaults, String? value) {
    if (value == null) {
      return null;
    }

    // We only know that the hub serials must be at least 16,
    // cannot be 17, but can be longer than that...
    if (value.length < 16 || value.length == 17) {
      return invalidHubSerialError ?? defaults.invalidHubSerial;
    }

    return null;
  }
}
