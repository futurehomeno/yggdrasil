/// The value of a [YgLayoutHeaderController].
class YgLayoutControllerValue {
  const YgLayoutControllerValue({
    required this.headerShadow,
    required this.loading,
  });

  /// Whether the header shadow is currently visible.
  final bool headerShadow;

  /// Whether the loading bar is currently visible.
  final bool loading;

  YgLayoutControllerValue copyWith({
    bool? headerShadow,
    bool? loading,
  }) {
    return YgLayoutControllerValue(
      headerShadow: headerShadow ?? this.headerShadow,
      loading: loading ?? this.loading,
    );
  }

  @override
  int get hashCode => Object.hash(
        headerShadow,
        loading,
      );

  @override
  bool operator ==(Object other) =>
      other is YgLayoutControllerValue && other.headerShadow == headerShadow && other.loading == loading;
}
