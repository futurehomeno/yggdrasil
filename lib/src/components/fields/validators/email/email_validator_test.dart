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

    test('should return null when value is an empty string', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '',
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

    test('should return null for email of format a@b.cd', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a@b.cd';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, null);
    });

    test('should return error for email with one char in top level domain', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a@b.c';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, error);
    });

    test('should return null for null email', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String? email = null;

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, null);
    });

    // Note that email without top level domain is actually valid, but
    // is not used in 99% of cases, and most of the time it's an error
    // on the user's side.
    test('should return error for email without top level domain', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a@b';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, error);
    });

    test('should return null for email with + divider', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a+b@c.de';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, null);
    });

    test('should return null for email with multiple dots', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a.b.c@d.e.fg';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, null);
    });

    test('should return null for email with - divider', () {
      // PREPARE
      const EmailValidator validator = EmailValidator(invalidEmailError: error);
      const String email = 'a-b@c-d.ef';

      // TRIGGER
      final String? res = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        email,
      );

      // TEST
      expect(res, null);
    });
  });
}
