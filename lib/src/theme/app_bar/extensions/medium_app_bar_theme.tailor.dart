// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'medium_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class MediumAppBarTheme extends ThemeExtension<MediumAppBarTheme> {
  const MediumAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final MediumAppBarTheme consumerLight = MediumAppBarTheme(
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[0],
  );

  static final MediumAppBarTheme consumerDark = MediumAppBarTheme(
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[1],
  );

  static final MediumAppBarTheme professionalLight = MediumAppBarTheme(
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[2],
  );

  static final MediumAppBarTheme professionalDark = MediumAppBarTheme(
    titleTextStyle: _$MediumAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  MediumAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return MediumAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  MediumAppBarTheme lerp(
      covariant ThemeExtension<MediumAppBarTheme>? other, double t) {
    if (other is! MediumAppBarTheme) return this as MediumAppBarTheme;
    return MediumAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MediumAppBarTheme &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
