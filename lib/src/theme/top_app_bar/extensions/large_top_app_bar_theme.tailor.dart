// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'large_top_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LargeTopAppBarTheme extends ThemeExtension<LargeTopAppBarTheme> {
  const LargeTopAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final LargeTopAppBarTheme consumerLight = LargeTopAppBarTheme(
    titleTextStyle: _$LargeTopAppBarTheme.titleTextStyle[0],
  );

  static final LargeTopAppBarTheme consumerDark = LargeTopAppBarTheme(
    titleTextStyle: _$LargeTopAppBarTheme.titleTextStyle[1],
  );

  static final LargeTopAppBarTheme professionalLight = LargeTopAppBarTheme(
    titleTextStyle: _$LargeTopAppBarTheme.titleTextStyle[2],
  );

  static final LargeTopAppBarTheme professionalDark = LargeTopAppBarTheme(
    titleTextStyle: _$LargeTopAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LargeTopAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return LargeTopAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  LargeTopAppBarTheme lerp(
      covariant ThemeExtension<LargeTopAppBarTheme>? other, double t) {
    if (other is! LargeTopAppBarTheme) return this as LargeTopAppBarTheme;
    return LargeTopAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LargeTopAppBarTheme &&
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
