// ignore_for_file: always_specify_types, strict_raw_type, must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'checkbox_field_key.dart';
import 'mock_checkbox_field_key.mocks.dart';

@GenerateMocks(<Type>[], customMocks: <MockSpec<dynamic>>[
  MockSpec<CheckboxFieldKey>(as: #GeneratedMockCheckboxFieldKey),
])
class MockCheckboxFieldKey extends GeneratedMockCheckboxFieldKey {
  void mockValue(bool mockValue) {
    when(
      value,
    ).thenAnswer(
      (_) => mockValue,
    );
  }
}
