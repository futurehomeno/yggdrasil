import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('MaxLengthValidator', () {
    const String error = 'value_too_long';

    test('should return an error if value is too long', () {
      // PREPARE
      const MaxLengthValidator validator = MaxLengthValidator(
        max: 1,
        tooLongError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '12');

      // TEST
      expect(result, error);
    });

    test('should return null if value is not too long', () {
      // PREPARE
      const MaxLengthValidator validator = MaxLengthValidator(
        max: 2,
        tooLongError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '12');

      // TEST
      expect(result, isNull);
    });

    test('should return null when value is null', () {
      // PREPARE
      const MaxLengthValidator validator = MaxLengthValidator(
        max: 2,
        tooLongError: error,
      );

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, isNull);
    });
  });
}
