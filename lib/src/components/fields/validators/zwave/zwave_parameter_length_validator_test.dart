import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('ZwaveParameterLengthValidator', () {
    const String error = 'invalid_parameter_length';

    // value can only be "1", "2", "4" or null

    test('should return null when value is "1"', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator(
        invalidZwaveParameterLengthError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '1');

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is "2"', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator(
        invalidZwaveParameterLengthError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '2');

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is "4"', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator(
        invalidZwaveParameterLengthError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '4');

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is null', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator(
        invalidZwaveParameterLengthError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, isNull);
    });

    test('should return error when value is "5"', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator(
        invalidZwaveParameterLengthError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '5');

      // TEST
      expect(result, error);
    });

    test('returns the default error if invalidZwaveParameterLengthError is not provided', () {
      // PREPARE
      const ZwaveParameterLengthValidator validator = ZwaveParameterLengthValidator();

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '5');

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.invalidZwaveParameterLength);
    });
  });
}
