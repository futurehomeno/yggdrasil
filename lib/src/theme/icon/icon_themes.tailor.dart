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
    required this.sizeMedium,
    required this.sizeSmall,
  });

  final double sizeLarge;
  final double sizeMedium;
  final double sizeSmall;

  static final YgIconThemes consumerLight = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[0],
    sizeMedium: _$YgIconThemes.sizeMedium[0],
    sizeSmall: _$YgIconThemes.sizeSmall[0],
  );

  static final YgIconThemes consumerDark = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[1],
    sizeMedium: _$YgIconThemes.sizeMedium[1],
    sizeSmall: _$YgIconThemes.sizeSmall[1],
  );

  static final YgIconThemes professionalLight = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[2],
    sizeMedium: _$YgIconThemes.sizeMedium[2],
    sizeSmall: _$YgIconThemes.sizeSmall[2],
  );

  static final YgIconThemes professionalDark = YgIconThemes(
    sizeLarge: _$YgIconThemes.sizeLarge[3],
    sizeMedium: _$YgIconThemes.sizeMedium[3],
    sizeSmall: _$YgIconThemes.sizeSmall[3],
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
    double? sizeMedium,
    double? sizeSmall,
  }) {
    return YgIconThemes(
      sizeLarge: sizeLarge ?? this.sizeLarge,
      sizeMedium: sizeMedium ?? this.sizeMedium,
      sizeSmall: sizeSmall ?? this.sizeSmall,
    );
  }

  @override
  YgIconThemes lerp(covariant ThemeExtension<YgIconThemes>? other, double t) {
    if (other is! YgIconThemes) return this as YgIconThemes;
    return YgIconThemes(
      sizeLarge: t < 0.5 ? sizeLarge : other.sizeLarge,
      sizeMedium: t < 0.5 ? sizeMedium : other.sizeMedium,
      sizeSmall: t < 0.5 ? sizeSmall : other.sizeSmall,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconThemes &&
            const DeepCollectionEquality().equals(sizeLarge, other.sizeLarge) &&
            const DeepCollectionEquality()
                .equals(sizeMedium, other.sizeMedium) &&
            const DeepCollectionEquality().equals(sizeSmall, other.sizeSmall));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(sizeLarge),
      const DeepCollectionEquality().hash(sizeMedium),
      const DeepCollectionEquality().hash(sizeSmall),
    );
  }
}
