import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('MinLengthValidator', () {
    const String error = 'value_too_short';

    test('should return error value is too short', () {
      // PREPARE
      const MinLengthValidator validator = MinLengthValidator(
        min: 2,
        tooShortError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '1');

      // TEST
      expect(result, error);
    });

    test('should return null value is not too short', () {
      // PREPARE
      const MinLengthValidator validator = MinLengthValidator(
        min: 2,
        tooShortError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '12');

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is null', () {
      // PREPARE
      const MinLengthValidator validator = MinLengthValidator(
        min: 2,
        tooShortError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, isNull);
    });
  });
}
