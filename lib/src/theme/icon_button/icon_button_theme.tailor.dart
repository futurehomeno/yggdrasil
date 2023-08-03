// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgIconButtonTheme extends ThemeExtension<YgIconButtonTheme> {
  const YgIconButtonTheme({
    required this.filledIconButtonTheme,
    required this.iconSizeMedium,
    required this.iconSizeSmall,
    required this.outlinedIconButtonTheme,
    required this.sizeMedium,
    required this.sizeSmall,
    required this.standardIconButtonTheme,
    required this.tonalIconButtonTheme,
  });

  final FilledIconButtonTheme filledIconButtonTheme;
  final double iconSizeMedium;
  final double iconSizeSmall;
  final OutlinedIconButtonTheme outlinedIconButtonTheme;
  final double sizeMedium;
  final double sizeSmall;
  final StandardIconButtonTheme standardIconButtonTheme;
  final TonalIconButtonTheme tonalIconButtonTheme;

  static final YgIconButtonTheme consumerLight = YgIconButtonTheme(
    filledIconButtonTheme: _$YgIconButtonTheme.filledIconButtonTheme[0],
    iconSizeMedium: _$YgIconButtonTheme.iconSizeMedium[0],
    iconSizeSmall: _$YgIconButtonTheme.iconSizeSmall[0],
    outlinedIconButtonTheme: _$YgIconButtonTheme.outlinedIconButtonTheme[0],
    sizeMedium: _$YgIconButtonTheme.sizeMedium[0],
    sizeSmall: _$YgIconButtonTheme.sizeSmall[0],
    standardIconButtonTheme: _$YgIconButtonTheme.standardIconButtonTheme[0],
    tonalIconButtonTheme: _$YgIconButtonTheme.tonalIconButtonTheme[0],
  );

  static final YgIconButtonTheme consumerDark = YgIconButtonTheme(
    filledIconButtonTheme: _$YgIconButtonTheme.filledIconButtonTheme[1],
    iconSizeMedium: _$YgIconButtonTheme.iconSizeMedium[1],
    iconSizeSmall: _$YgIconButtonTheme.iconSizeSmall[1],
    outlinedIconButtonTheme: _$YgIconButtonTheme.outlinedIconButtonTheme[1],
    sizeMedium: _$YgIconButtonTheme.sizeMedium[1],
    sizeSmall: _$YgIconButtonTheme.sizeSmall[1],
    standardIconButtonTheme: _$YgIconButtonTheme.standardIconButtonTheme[1],
    tonalIconButtonTheme: _$YgIconButtonTheme.tonalIconButtonTheme[1],
  );

  static final YgIconButtonTheme professionalLight = YgIconButtonTheme(
    filledIconButtonTheme: _$YgIconButtonTheme.filledIconButtonTheme[2],
    iconSizeMedium: _$YgIconButtonTheme.iconSizeMedium[2],
    iconSizeSmall: _$YgIconButtonTheme.iconSizeSmall[2],
    outlinedIconButtonTheme: _$YgIconButtonTheme.outlinedIconButtonTheme[2],
    sizeMedium: _$YgIconButtonTheme.sizeMedium[2],
    sizeSmall: _$YgIconButtonTheme.sizeSmall[2],
    standardIconButtonTheme: _$YgIconButtonTheme.standardIconButtonTheme[2],
    tonalIconButtonTheme: _$YgIconButtonTheme.tonalIconButtonTheme[2],
  );

  static final YgIconButtonTheme professionalDark = YgIconButtonTheme(
    filledIconButtonTheme: _$YgIconButtonTheme.filledIconButtonTheme[3],
    iconSizeMedium: _$YgIconButtonTheme.iconSizeMedium[3],
    iconSizeSmall: _$YgIconButtonTheme.iconSizeSmall[3],
    outlinedIconButtonTheme: _$YgIconButtonTheme.outlinedIconButtonTheme[3],
    sizeMedium: _$YgIconButtonTheme.sizeMedium[3],
    sizeSmall: _$YgIconButtonTheme.sizeSmall[3],
    standardIconButtonTheme: _$YgIconButtonTheme.standardIconButtonTheme[3],
    tonalIconButtonTheme: _$YgIconButtonTheme.tonalIconButtonTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgIconButtonTheme copyWith({
    FilledIconButtonTheme? filledIconButtonTheme,
    double? iconSizeMedium,
    double? iconSizeSmall,
    OutlinedIconButtonTheme? outlinedIconButtonTheme,
    double? sizeMedium,
    double? sizeSmall,
    StandardIconButtonTheme? standardIconButtonTheme,
    TonalIconButtonTheme? tonalIconButtonTheme,
  }) {
    return YgIconButtonTheme(
      filledIconButtonTheme:
          filledIconButtonTheme ?? this.filledIconButtonTheme,
      iconSizeMedium: iconSizeMedium ?? this.iconSizeMedium,
      iconSizeSmall: iconSizeSmall ?? this.iconSizeSmall,
      outlinedIconButtonTheme:
          outlinedIconButtonTheme ?? this.outlinedIconButtonTheme,
      sizeMedium: sizeMedium ?? this.sizeMedium,
      sizeSmall: sizeSmall ?? this.sizeSmall,
      standardIconButtonTheme:
          standardIconButtonTheme ?? this.standardIconButtonTheme,
      tonalIconButtonTheme: tonalIconButtonTheme ?? this.tonalIconButtonTheme,
    );
  }

  @override
  YgIconButtonTheme lerp(
      covariant ThemeExtension<YgIconButtonTheme>? other, double t) {
    if (other is! YgIconButtonTheme) return this as YgIconButtonTheme;
    return YgIconButtonTheme(
      filledIconButtonTheme: filledIconButtonTheme.lerp(
          other.filledIconButtonTheme, t) as FilledIconButtonTheme,
      iconSizeMedium: t < 0.5 ? iconSizeMedium : other.iconSizeMedium,
      iconSizeSmall: t < 0.5 ? iconSizeSmall : other.iconSizeSmall,
      outlinedIconButtonTheme: outlinedIconButtonTheme.lerp(
          other.outlinedIconButtonTheme, t) as OutlinedIconButtonTheme,
      sizeMedium: t < 0.5 ? sizeMedium : other.sizeMedium,
      sizeSmall: t < 0.5 ? sizeSmall : other.sizeSmall,
      standardIconButtonTheme: standardIconButtonTheme.lerp(
          other.standardIconButtonTheme, t) as StandardIconButtonTheme,
      tonalIconButtonTheme: tonalIconButtonTheme.lerp(
          other.tonalIconButtonTheme, t) as TonalIconButtonTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgIconButtonTheme &&
            const DeepCollectionEquality()
                .equals(filledIconButtonTheme, other.filledIconButtonTheme) &&
            const DeepCollectionEquality()
                .equals(iconSizeMedium, other.iconSizeMedium) &&
            const DeepCollectionEquality()
                .equals(iconSizeSmall, other.iconSizeSmall) &&
            const DeepCollectionEquality().equals(
                outlinedIconButtonTheme, other.outlinedIconButtonTheme) &&
            const DeepCollectionEquality()
                .equals(sizeMedium, other.sizeMedium) &&
            const DeepCollectionEquality().equals(sizeSmall, other.sizeSmall) &&
            const DeepCollectionEquality().equals(
                standardIconButtonTheme, other.standardIconButtonTheme) &&
            const DeepCollectionEquality()
                .equals(tonalIconButtonTheme, other.tonalIconButtonTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(filledIconButtonTheme),
      const DeepCollectionEquality().hash(iconSizeMedium),
      const DeepCollectionEquality().hash(iconSizeSmall),
      const DeepCollectionEquality().hash(outlinedIconButtonTheme),
      const DeepCollectionEquality().hash(sizeMedium),
      const DeepCollectionEquality().hash(sizeSmall),
      const DeepCollectionEquality().hash(standardIconButtonTheme),
      const DeepCollectionEquality().hash(tonalIconButtonTheme),
    );
  }
}
