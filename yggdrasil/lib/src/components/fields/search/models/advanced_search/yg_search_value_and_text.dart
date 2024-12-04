/// Both the value and the textual representation of the value.
class YgSearchValueAndText<Value> {
  const YgSearchValueAndText({
    required this.value,
    required this.text,
  });

  /// The value.
  final Value value;

  /// The textual representation of the value.
  final String text;
}
