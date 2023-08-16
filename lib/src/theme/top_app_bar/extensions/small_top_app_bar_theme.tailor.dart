// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'small_top_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SmallTopAppBarTheme extends ThemeExtension<SmallTopAppBarTheme> {
  const SmallTopAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final SmallTopAppBarTheme consumerLight = SmallTopAppBarTheme(
    titleTextStyle: _$SmallTopAppBarTheme.titleTextStyle[0],
  );

  static final SmallTopAppBarTheme consumerDark = SmallTopAppBarTheme(
    titleTextStyle: _$SmallTopAppBarTheme.titleTextStyle[1],
  );

  static final SmallTopAppBarTheme professionalLight = SmallTopAppBarTheme(
    titleTextStyle: _$SmallTopAppBarTheme.titleTextStyle[2],
  );

  static final SmallTopAppBarTheme professionalDark = SmallTopAppBarTheme(
    titleTextStyle: _$SmallTopAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SmallTopAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return SmallTopAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  SmallTopAppBarTheme lerp(
      covariant ThemeExtension<SmallTopAppBarTheme>? other, double t) {
    if (other is! SmallTopAppBarTheme) return this as SmallTopAppBarTheme;
    return SmallTopAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SmallTopAppBarTheme &&
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
