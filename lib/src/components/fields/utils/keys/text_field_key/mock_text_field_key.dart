// ignore_for_file: always_specify_types, strict_raw_type, must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_text_field_key.mocks.dart';
import 'text_field_key.dart';

@GenerateMocks(<Type>[], customMocks: <MockSpec<dynamic>>[
  MockSpec<TextFieldKey>(as: #GeneratedMockTextFieldKey),
])
class MockTextFieldKey extends GeneratedMockTextFieldKey {
  void mockValue(String mockValue) {
    when(
      value,
    ).thenAnswer(
      (_) => mockValue,
    );
  }
}
