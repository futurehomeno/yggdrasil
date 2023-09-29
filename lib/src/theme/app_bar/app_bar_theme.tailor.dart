// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAppBarTheme extends ThemeExtension<YgAppBarTheme> {
  const YgAppBarTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.largeAppBarTheme,
    required this.leadingSize,
    required this.mediumAppBarTheme,
    required this.smallAppBarTheme,
    required this.trailingSize,
  });

  final Color backgroundColor;
  final Color borderColor;
  final LargeAppBarTheme largeAppBarTheme;
  final double leadingSize;
  final MediumAppBarTheme mediumAppBarTheme;
  final SmallAppBarTheme smallAppBarTheme;
  final double trailingSize;

  static final YgAppBarTheme consumerLight = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[0],
    borderColor: _$YgAppBarTheme.borderColor[0],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[0],
    leadingSize: _$YgAppBarTheme.leadingSize[0],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[0],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[0],
    trailingSize: _$YgAppBarTheme.trailingSize[0],
  );

  static final YgAppBarTheme consumerDark = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[1],
    borderColor: _$YgAppBarTheme.borderColor[1],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[1],
    leadingSize: _$YgAppBarTheme.leadingSize[1],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[1],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[1],
    trailingSize: _$YgAppBarTheme.trailingSize[1],
  );

  static final YgAppBarTheme professionalLight = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[2],
    borderColor: _$YgAppBarTheme.borderColor[2],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[2],
    leadingSize: _$YgAppBarTheme.leadingSize[2],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[2],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[2],
    trailingSize: _$YgAppBarTheme.trailingSize[2],
  );

  static final YgAppBarTheme professionalDark = YgAppBarTheme(
    backgroundColor: _$YgAppBarTheme.backgroundColor[3],
    borderColor: _$YgAppBarTheme.borderColor[3],
    largeAppBarTheme: _$YgAppBarTheme.largeAppBarTheme[3],
    leadingSize: _$YgAppBarTheme.leadingSize[3],
    mediumAppBarTheme: _$YgAppBarTheme.mediumAppBarTheme[3],
    smallAppBarTheme: _$YgAppBarTheme.smallAppBarTheme[3],
    trailingSize: _$YgAppBarTheme.trailingSize[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAppBarTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    LargeAppBarTheme? largeAppBarTheme,
    double? leadingSize,
    MediumAppBarTheme? mediumAppBarTheme,
    SmallAppBarTheme? smallAppBarTheme,
    double? trailingSize,
  }) {
    return YgAppBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      largeAppBarTheme: largeAppBarTheme ?? this.largeAppBarTheme,
      leadingSize: leadingSize ?? this.leadingSize,
      mediumAppBarTheme: mediumAppBarTheme ?? this.mediumAppBarTheme,
      smallAppBarTheme: smallAppBarTheme ?? this.smallAppBarTheme,
      trailingSize: trailingSize ?? this.trailingSize,
    );
  }

  @override
  YgAppBarTheme lerp(covariant ThemeExtension<YgAppBarTheme>? other, double t) {
    if (other is! YgAppBarTheme) return this as YgAppBarTheme;
    return YgAppBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      largeAppBarTheme:
          largeAppBarTheme.lerp(other.largeAppBarTheme, t) as LargeAppBarTheme,
      leadingSize: t < 0.5 ? leadingSize : other.leadingSize,
      mediumAppBarTheme: mediumAppBarTheme.lerp(other.mediumAppBarTheme, t)
          as MediumAppBarTheme,
      smallAppBarTheme:
          smallAppBarTheme.lerp(other.smallAppBarTheme, t) as SmallAppBarTheme,
      trailingSize: t < 0.5 ? trailingSize : other.trailingSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAppBarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality()
                .equals(largeAppBarTheme, other.largeAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(leadingSize, other.leadingSize) &&
            const DeepCollectionEquality()
                .equals(mediumAppBarTheme, other.mediumAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(smallAppBarTheme, other.smallAppBarTheme) &&
            const DeepCollectionEquality()
                .equals(trailingSize, other.trailingSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(largeAppBarTheme),
      const DeepCollectionEquality().hash(leadingSize),
      const DeepCollectionEquality().hash(mediumAppBarTheme),
      const DeepCollectionEquality().hash(smallAppBarTheme),
      const DeepCollectionEquality().hash(trailingSize),
    );
  }
}
