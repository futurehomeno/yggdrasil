// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'top_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTopAppBarTheme extends ThemeExtension<YgTopAppBarTheme> {
  const YgTopAppBarTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.largeTopAppBarTheme,
    required this.leadingSize,
    required this.mediumTopAppBarTheme,
    required this.smallTopAppBarTheme,
    required this.trailingSize,
  });

  final Color backgroundColor;
  final Color borderColor;
  final LargeTopAppBarTheme largeTopAppBarTheme;
  final double leadingSize;
  final MediumTopAppBarTheme mediumTopAppBarTheme;
  final SmallTopAppBarTheme smallTopAppBarTheme;
  final double trailingSize;

  static final YgTopAppBarTheme consumerLight = YgTopAppBarTheme(
    backgroundColor: _$YgTopAppBarTheme.backgroundColor[0],
    borderColor: _$YgTopAppBarTheme.borderColor[0],
    largeTopAppBarTheme: _$YgTopAppBarTheme.largeTopAppBarTheme[0],
    leadingSize: _$YgTopAppBarTheme.leadingSize[0],
    mediumTopAppBarTheme: _$YgTopAppBarTheme.mediumTopAppBarTheme[0],
    smallTopAppBarTheme: _$YgTopAppBarTheme.smallTopAppBarTheme[0],
    trailingSize: _$YgTopAppBarTheme.trailingSize[0],
  );

  static final YgTopAppBarTheme consumerDark = YgTopAppBarTheme(
    backgroundColor: _$YgTopAppBarTheme.backgroundColor[1],
    borderColor: _$YgTopAppBarTheme.borderColor[1],
    largeTopAppBarTheme: _$YgTopAppBarTheme.largeTopAppBarTheme[1],
    leadingSize: _$YgTopAppBarTheme.leadingSize[1],
    mediumTopAppBarTheme: _$YgTopAppBarTheme.mediumTopAppBarTheme[1],
    smallTopAppBarTheme: _$YgTopAppBarTheme.smallTopAppBarTheme[1],
    trailingSize: _$YgTopAppBarTheme.trailingSize[1],
  );

  static final YgTopAppBarTheme professionalLight = YgTopAppBarTheme(
    backgroundColor: _$YgTopAppBarTheme.backgroundColor[2],
    borderColor: _$YgTopAppBarTheme.borderColor[2],
    largeTopAppBarTheme: _$YgTopAppBarTheme.largeTopAppBarTheme[2],
    leadingSize: _$YgTopAppBarTheme.leadingSize[2],
    mediumTopAppBarTheme: _$YgTopAppBarTheme.mediumTopAppBarTheme[2],
    smallTopAppBarTheme: _$YgTopAppBarTheme.smallTopAppBarTheme[2],
    trailingSize: _$YgTopAppBarTheme.trailingSize[2],
  );

  static final YgTopAppBarTheme professionalDark = YgTopAppBarTheme(
    backgroundColor: _$YgTopAppBarTheme.backgroundColor[3],
    borderColor: _$YgTopAppBarTheme.borderColor[3],
    largeTopAppBarTheme: _$YgTopAppBarTheme.largeTopAppBarTheme[3],
    leadingSize: _$YgTopAppBarTheme.leadingSize[3],
    mediumTopAppBarTheme: _$YgTopAppBarTheme.mediumTopAppBarTheme[3],
    smallTopAppBarTheme: _$YgTopAppBarTheme.smallTopAppBarTheme[3],
    trailingSize: _$YgTopAppBarTheme.trailingSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTopAppBarTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    LargeTopAppBarTheme? largeTopAppBarTheme,
    double? leadingSize,
    MediumTopAppBarTheme? mediumTopAppBarTheme,
    SmallTopAppBarTheme? smallTopAppBarTheme,
    double? trailingSize,
  }) {
    return YgTopAppBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      largeTopAppBarTheme: largeTopAppBarTheme ?? this.largeTopAppBarTheme,
      leadingSize: leadingSize ?? this.leadingSize,
      mediumTopAppBarTheme: mediumTopAppBarTheme ?? this.mediumTopAppBarTheme,
      smallTopAppBarTheme: smallTopAppBarTheme ?? this.smallTopAppBarTheme,
      trailingSize: trailingSize ?? this.trailingSize,
    );
  }

  @override
  YgTopAppBarTheme lerp(
      covariant ThemeExtension<YgTopAppBarTheme>? other, double t) {
    if (other is! YgTopAppBarTheme) return this as YgTopAppBarTheme;
    return YgTopAppBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      largeTopAppBarTheme: largeTopAppBarTheme.lerp(
          other.largeTopAppBarTheme, t) as LargeTopAppBarTheme,
      leadingSize: t < 0.5 ? leadingSize : other.leadingSize,
      mediumTopAppBarTheme: mediumTopAppBarTheme.lerp(
          other.mediumTopAppBarTheme, t) as MediumTopAppBarTheme,
      smallTopAppBarTheme: smallTopAppBarTheme.lerp(
          other.smallTopAppBarTheme, t) as SmallTopAppBarTheme,
      trailingSize: t < 0.5 ? trailingSize : other.trailingSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgTopAppBarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(largeTopAppBarTheme, other.largeTopAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(leadingSize, other.leadingSize) &&
            const DeepCollectionEquality()
                .equals(mediumTopAppBarTheme, other.mediumTopAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(smallTopAppBarTheme, other.smallTopAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(trailingSize, other.trailingSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(largeTopAppBarTheme),
      const DeepCollectionEquality().hash(leadingSize),
      const DeepCollectionEquality().hash(mediumTopAppBarTheme),
      const DeepCollectionEquality().hash(smallTopAppBarTheme),
      const DeepCollectionEquality().hash(trailingSize),
    );
  }
}
