import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('EmailValidator', () {
    const String error = 'invalid_email';
    const String validEmail = 'valid_email@example.com';
    const String invalidEmail = 'well this is clearly not an email';

    test('should return error when value is not an email', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        invalidEmail,
      );

      // TEST
      expect(result, error);
    });

    test('should return null when value is a valid email', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        validEmail,
      );

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is null', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        null,
      );

      // TEST
      expect(result, isNull);
    });

    test('should return the default error if the invalidEmailError is not specified', () {
      // PREPARE
      const EmailValidator validator = EmailValidator();

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        invalidEmail,
      );

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.invalidEmail);
    });
  });
}
