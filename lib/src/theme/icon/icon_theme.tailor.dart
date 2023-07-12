// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconTheme extends ThemeExtension<YgIconTheme> {
  const YgIconTheme({
    required this.sizeLarge,
    required this.sizeLarger,
    required this.sizeLargest,
    required this.sizeSmall,
    required this.sizeSmaller,
  });

  final double sizeLarge;
  final double sizeLarger;
  final double sizeLargest;
  final double sizeSmall;
  final double sizeSmaller;

  static final YgIconTheme consumerLight = YgIconTheme(
    sizeLarge: _$YgIconTheme.sizeLarge[0],
    sizeLarger: _$YgIconTheme.sizeLarger[0],
    sizeLargest: _$YgIconTheme.sizeLargest[0],
    sizeSmall: _$YgIconTheme.sizeSmall[0],
    sizeSmaller: _$YgIconTheme.sizeSmaller[0],
  );

  static final YgIconTheme consumerDark = YgIconTheme(
    sizeLarge: _$YgIconTheme.sizeLarge[1],
    sizeLarger: _$YgIconTheme.sizeLarger[1],
    sizeLargest: _$YgIconTheme.sizeLargest[1],
    sizeSmall: _$YgIconTheme.sizeSmall[1],
    sizeSmaller: _$YgIconTheme.sizeSmaller[1],
  );

  static final YgIconTheme professionalLight = YgIconTheme(
    sizeLarge: _$YgIconTheme.sizeLarge[2],
    sizeLarger: _$YgIconTheme.sizeLarger[2],
    sizeLargest: _$YgIconTheme.sizeLargest[2],
    sizeSmall: _$YgIconTheme.sizeSmall[2],
    sizeSmaller: _$YgIconTheme.sizeSmaller[2],
  );

  static final YgIconTheme professionalDark = YgIconTheme(
    sizeLarge: _$YgIconTheme.sizeLarge[3],
    sizeLarger: _$YgIconTheme.sizeLarger[3],
    sizeLargest: _$YgIconTheme.sizeLargest[3],
    sizeSmall: _$YgIconTheme.sizeSmall[3],
    sizeSmaller: _$YgIconTheme.sizeSmaller[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconTheme copyWith({
    double? sizeLarge,
    double? sizeLarger,
    double? sizeLargest,
    double? sizeSmall,
    double? sizeSmaller,
  }) {
    return YgIconTheme(
      sizeLarge: sizeLarge ?? this.sizeLarge,
      sizeLarger: sizeLarger ?? this.sizeLarger,
      sizeLargest: sizeLargest ?? this.sizeLargest,
      sizeSmall: sizeSmall ?? this.sizeSmall,
      sizeSmaller: sizeSmaller ?? this.sizeSmaller,
    );
  }

  @override
  YgIconTheme lerp(covariant ThemeExtension<YgIconTheme>? other, double t) {
    if (other is! YgIconTheme) return this as YgIconTheme;
    return YgIconTheme(
      sizeLarge: t < 0.5 ? sizeLarge : other.sizeLarge,
      sizeLarger: t < 0.5 ? sizeLarger : other.sizeLarger,
      sizeLargest: t < 0.5 ? sizeLargest : other.sizeLargest,
      sizeSmall: t < 0.5 ? sizeSmall : other.sizeSmall,
      sizeSmaller: t < 0.5 ? sizeSmaller : other.sizeSmaller,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconTheme &&
            const DeepCollectionEquality().equals(sizeLarge, other.sizeLarge) &&
            const DeepCollectionEquality()
                .equals(sizeLarger, other.sizeLarger) &&
            const DeepCollectionEquality()
                .equals(sizeLargest, other.sizeLargest) &&
            const DeepCollectionEquality().equals(sizeSmall, other.sizeSmall) &&
            const DeepCollectionEquality()
                .equals(sizeSmaller, other.sizeSmaller));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(sizeLarge),
      const DeepCollectionEquality().hash(sizeLarger),
      const DeepCollectionEquality().hash(sizeLargest),
      const DeepCollectionEquality().hash(sizeSmall),
      const DeepCollectionEquality().hash(sizeSmaller),
    );
  }
}
