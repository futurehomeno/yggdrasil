// ignore_for_file: always_specify_types, strict_raw_type, must_be_immutable
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'form_field_key.dart';
import 'mock_form_field_key.mocks.dart';

@GenerateMocks(<Type>[], customMocks: <MockSpec<dynamic>>[
  MockSpec<FormFieldKey>(as: #GeneratedFormFieldKey),
])
class MockFormFieldKey<T> extends GeneratedFormFieldKey<T> {
  void mockValue(T mockValue) {
    when(
      value,
    ).thenAnswer(
      (_) => mockValue,
    );
  }
}
