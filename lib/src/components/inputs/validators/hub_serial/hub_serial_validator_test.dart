import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('HubSerialValidator', () {
    const String error = 'invalid_hub_serial';

    // We only know that the hub serials must be at least 16,
    // cannot be 17, but can be longer than that...

    const String valid16Char = '1234567890abcdef';
    const String validMoreThan17Char = '1234567890abcdefgh';
    const String invalid17Char = '1234567890abcdefg';
    const String invalidLessThan16Char = '1234567890abcde';

    test('should return error when value is less than 16 characters', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator(
        invalidHubSerialError: error,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        invalidLessThan16Char,
      );

      // TEST
      expect(result, error);
    });

    test('should return error when value is 17 characters', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator(
        invalidHubSerialError: error,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        invalid17Char,
      );

      // TEST
      expect(result, error);
    });

    test('should return null when value is 16 characters', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator(
        invalidHubSerialError: error,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        valid16Char,
      );

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is more than 17 characters', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator(
        invalidHubSerialError: error,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        validMoreThan17Char,
      );

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is null', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator(
        invalidHubSerialError: error,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        null,
      );

      // TEST
      expect(result, isNull);
    });

    test('should return the default error if the invalidHubSerialError is not specified', () {
      // PREPARE
      const HubSerialValidator validator = HubSerialValidator();

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        invalidLessThan16Char,
      );

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.invalidHubSerial);
    });
  });
}
