/// The value of a [YgLayoutHeaderController].
class YgLayoutHeaderControllerValue {
  const YgLayoutHeaderControllerValue({
    required this.shadow,
    required this.loading,
  });

  /// Whether the header shadow is currently visible.
  final bool shadow;

  /// Whether the loading bar is currently visible.
  final bool loading;

  YgLayoutHeaderControllerValue copyWith({
    bool? shadow,
    bool? loading,
  }) {
    return YgLayoutHeaderControllerValue(
      shadow: shadow ?? this.shadow,
      loading: loading ?? this.loading,
    );
  }

  @override
  int get hashCode => Object.hash(
    shadow,
    loading,
  );

  @override
  bool operator ==(Object other) =>
      other is YgLayoutHeaderControllerValue && other.shadow == shadow && other.loading == loading;
}
