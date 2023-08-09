import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('PhoneNumberValidator', () {
    const String invalidError = 'invalid_phone_number';
    const String tooShortError = 'too_short_error';
    const String tooLongError = 'too_long_error';

    test('should return null when the value is a valid phone number without country code', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '123456789',
      );

      // TEST
      expect(result, isNull);
    });

    test('should return error when the value is a phone number with country code if country code is disabled', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123456789',
      );

      // TEST
      expect(result, invalidError);
    });

    test('should return null when the value is a valid phone number with country code', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: true,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123456789',
      );

      // TEST
      expect(result, isNull);
    });

    test('should return error when the value is not a valid phone number', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '123456789a',
      );

      // TEST
      expect(result, invalidError);
    });

    test('should return error when the value is not a valid phone number with country code', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: true,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123456789a',
      );

      // TEST
      expect(result, invalidError);
    });

    test('should return error when the value is less than 6 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '12345',
      );

      // TEST
      expect(result, tooShortError);
    });

    test('should return error when the value is more than 15 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        tooShortError: tooShortError,
        tooLongError: tooLongError,
        invalidError: invalidError,
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '12345678910123456',
      );

      // TEST
      expect(result, tooLongError);
    });

    test('should return the default error when the tooShortError is null and the value is less than 6 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '12345',
      );

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.phoneNumberTooShort);
    });

    test('should return the default error when the tooLongError is null and the value more than 15 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '12345678910123456',
      );

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.phoneNumberTooLong);
    });

    test('should return the default error when the invalidError is null and the value is not valid', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '123456789a',
      );

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.phoneNumberInvalid);
    });

    test('should allow spaces in a phone number without country code', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: false,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '123 456 789',
      );

      // TEST
      expect(result, isNull);
    });

    test('should allow spaces in a phone number with country code', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: true,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123 456 789',
      );

      // TEST
      expect(result, isNull);
    });

    test('+ and spaces should not be counted when checking if the phone number is more than 5 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: true,
        tooShortError: tooShortError,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123 45',
      );

      // TEST
      expect(result, tooShortError);
    });

    test('+ and spaces should not be counted when checking if the phone number less than 16 digits', () {
      // PREPARE
      const PhoneNumberValidator validator = PhoneNumberValidator(
        withCountryCode: true,
        tooLongError: tooLongError,
      );

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        '+123 456 789 012345',
      );

      // TEST
      expect(result, isNull);
    });
  });
}
