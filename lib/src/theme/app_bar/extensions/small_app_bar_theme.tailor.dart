// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'small_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SmallAppBarTheme extends ThemeExtension<SmallAppBarTheme> {
  const SmallAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final SmallAppBarTheme consumerLight = SmallAppBarTheme(
    titleTextStyle: _$SmallAppBarTheme.titleTextStyle[0],
  );

  static final SmallAppBarTheme consumerDark = SmallAppBarTheme(
    titleTextStyle: _$SmallAppBarTheme.titleTextStyle[1],
  );

  static final SmallAppBarTheme professionalLight = SmallAppBarTheme(
    titleTextStyle: _$SmallAppBarTheme.titleTextStyle[2],
  );

  static final SmallAppBarTheme professionalDark = SmallAppBarTheme(
    titleTextStyle: _$SmallAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SmallAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return SmallAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  SmallAppBarTheme lerp(
      covariant ThemeExtension<SmallAppBarTheme>? other, double t) {
    if (other is! SmallAppBarTheme) return this as SmallAppBarTheme;
    return SmallAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SmallAppBarTheme &&
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
