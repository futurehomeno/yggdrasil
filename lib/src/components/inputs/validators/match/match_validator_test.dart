import 'package:flutter_test/flutter_test.dart';
import 'package:yggdrasil/yggdrasil.dart';

void main() {
  group('MatchValidator', () {
    const String error = 'fields_do_not_match';
    final MockTextFieldKey otherFieldKey = MockTextFieldKey();
    final MatchValidator<String> validator = MatchValidator<String>(
      otherKeyField: otherFieldKey,
      error: error,
    );

    test('should return error when the other value is not the same', () {
      // PREPARE
      otherFieldKey.mockValue('value1');

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        'value2',
      );

      expect(result, error);
    });

    test('should return null when the other value is the same', () {
      // PREPARE
      otherFieldKey.mockValue('value1');

      // TRIGGER
      final String? result = validator.validate(
        YgDefaultsValidatorErrorMocks.valid,
        'value1',
      );

      expect(result, isNull);
    });
  });
}
