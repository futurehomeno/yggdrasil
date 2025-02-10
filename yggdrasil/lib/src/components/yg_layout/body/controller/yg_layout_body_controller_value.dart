class YgLayoutBodyControllerValue {
  const YgLayoutBodyControllerValue({
    required this.loading,
    required this.extendAfter,
    required this.extendBefore,
  });

  final bool loading;
  final double extendBefore;
  final double extendAfter;

  YgLayoutBodyControllerValue copyWith({
    bool? loading,
    double? extendBefore,
    double? extendAfter,
  }) {
    return YgLayoutBodyControllerValue(
      loading: loading ?? this.loading,
      extendBefore: extendBefore ?? this.extendBefore,
      extendAfter: extendAfter ?? this.extendAfter,
    );
  }

  @override
  int get hashCode => Object.hash(
        loading,
        extendBefore,
        extendAfter,
      );

  @override
  bool operator ==(Object other) =>
      other is YgLayoutBodyControllerValue &&
      other.loading == loading &&
      other.extendBefore == extendBefore &&
      other.extendAfter == extendAfter;
}
