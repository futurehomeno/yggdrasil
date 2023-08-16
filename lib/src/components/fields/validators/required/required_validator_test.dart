import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('RequiredValidator', () {
    const String error = 'value_is_required';

    test('should return error when value is null', () {
      // PREPARE
      const RequiredValidator validator = RequiredValidator(requiredError: error);

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, error);
    });

    test('should return error when value is empty', () {
      // PREPARE
      const RequiredValidator validator = RequiredValidator(requiredError: error);

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, '');

      // TEST
      expect(result, error);
    });

    test('should return null when value is not null or empty', () {
      // PREPARE
      const RequiredValidator validator = RequiredValidator(requiredError: error);

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, 'value');

      // TEST
      expect(result, isNull);
    });

    test('should return the default error if the value is null but no custom error was specified', () {
      // PREPARE
      const RequiredValidator validator = RequiredValidator();

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, YgDefaultsValidatorErrorMocks.valid.required);
    });
  });
}
