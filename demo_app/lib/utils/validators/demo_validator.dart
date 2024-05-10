/// The most basic and generic validator interface.
abstract class DemoValidator<Value, ValueError> {
  const DemoValidator();

  /// Validates [value].
  ValueError? validate(Value value);
}
