// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'large_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LargeAppBarTheme extends ThemeExtension<LargeAppBarTheme> {
  const LargeAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final LargeAppBarTheme consumerLight = LargeAppBarTheme(
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[0],
  );

  static final LargeAppBarTheme consumerDark = LargeAppBarTheme(
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[1],
  );

  static final LargeAppBarTheme professionalLight = LargeAppBarTheme(
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[2],
  );

  static final LargeAppBarTheme professionalDark = LargeAppBarTheme(
    titleTextStyle: _$LargeAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LargeAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return LargeAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  LargeAppBarTheme lerp(
      covariant ThemeExtension<LargeAppBarTheme>? other, double t) {
    if (other is! LargeAppBarTheme) return this as LargeAppBarTheme;
    return LargeAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LargeAppBarTheme &&
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
