// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconThemes extends ThemeExtension<YgIconThemes> {
  const YgIconThemes({
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

  static final YgIconThemes consumerLight = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[0],
    sizeLarger: _$YgIconThemes.sizeLarger[0],
    sizeLargest: _$YgIconThemes.sizeLargest[0],
    sizeSmall: _$YgIconThemes.sizeSmall[0],
    sizeSmaller: _$YgIconThemes.sizeSmaller[0],
  );

  static final YgIconThemes consumerDark = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[1],
    sizeLarger: _$YgIconThemes.sizeLarger[1],
    sizeLargest: _$YgIconThemes.sizeLargest[1],
    sizeSmall: _$YgIconThemes.sizeSmall[1],
    sizeSmaller: _$YgIconThemes.sizeSmaller[1],
  );

  static final YgIconThemes professionalLight = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[2],
    sizeLarger: _$YgIconThemes.sizeLarger[2],
    sizeLargest: _$YgIconThemes.sizeLargest[2],
    sizeSmall: _$YgIconThemes.sizeSmall[2],
    sizeSmaller: _$YgIconThemes.sizeSmaller[2],
  );

  static final YgIconThemes professionalDark = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[3],
    sizeLarger: _$YgIconThemes.sizeLarger[3],
    sizeLargest: _$YgIconThemes.sizeLargest[3],
    sizeSmall: _$YgIconThemes.sizeSmall[3],
    sizeSmaller: _$YgIconThemes.sizeSmaller[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconThemes copyWith({
    double? sizeLarge,
    double? sizeLarger,
    double? sizeLargest,
    double? sizeSmall,
    double? sizeSmaller,
  }) {
    return YgIconThemes(
      sizeLarge: sizeLarge ?? this.sizeLarge,
      sizeLarger: sizeLarger ?? this.sizeLarger,
      sizeLargest: sizeLargest ?? this.sizeLargest,
      sizeSmall: sizeSmall ?? this.sizeSmall,
      sizeSmaller: sizeSmaller ?? this.sizeSmaller,
    );
  }

  @override
  YgIconThemes lerp(covariant ThemeExtension<YgIconThemes>? other, double t) {
    if (other is! YgIconThemes) return this as YgIconThemes;
    return YgIconThemes(
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
            other is YgIconThemes &&
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
