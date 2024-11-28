class YgSearchValueAndText<Value> {
  const YgSearchValueAndText({
    required this.value,
    this.resultText,
  });

  final String? resultText;
  final Value value;
}
