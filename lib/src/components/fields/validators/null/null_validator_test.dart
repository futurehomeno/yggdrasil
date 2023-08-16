import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('NullValidator', () {
    const String error = 'value_is_null';

    test('should return error value is null', () {
      // PREPARE
      const NullValidator validator = NullValidator(nullError: error);

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, null);

      // TEST
      expect(result, error);
    });

    test('should return null value is not null', () {
      // PREPARE
      const NullValidator validator = NullValidator(nullError: error);

      // TRIGGER
      final String? result = validator.validate(YgDefaultsValidatorErrorMocks.valid, 'value');

      // TEST
      expect(result, isNull);
    });
  });
}
