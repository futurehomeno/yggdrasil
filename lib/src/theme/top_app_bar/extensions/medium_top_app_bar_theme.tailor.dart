// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'medium_top_app_bar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class MediumTopAppBarTheme extends ThemeExtension<MediumTopAppBarTheme> {
  const MediumTopAppBarTheme({
    required this.titleTextStyle,
  });

  final TextStyle titleTextStyle;

  static final MediumTopAppBarTheme consumerLight = MediumTopAppBarTheme(
    titleTextStyle: _$MediumTopAppBarTheme.titleTextStyle[0],
  );

  static final MediumTopAppBarTheme consumerDark = MediumTopAppBarTheme(
    titleTextStyle: _$MediumTopAppBarTheme.titleTextStyle[1],
  );

  static final MediumTopAppBarTheme professionalLight = MediumTopAppBarTheme(
    titleTextStyle: _$MediumTopAppBarTheme.titleTextStyle[2],
  );

  static final MediumTopAppBarTheme professionalDark = MediumTopAppBarTheme(
    titleTextStyle: _$MediumTopAppBarTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  MediumTopAppBarTheme copyWith({
    TextStyle? titleTextStyle,
  }) {
    return MediumTopAppBarTheme(
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  MediumTopAppBarTheme lerp(
      covariant ThemeExtension<MediumTopAppBarTheme>? other, double t) {
    if (other is! MediumTopAppBarTheme) return this as MediumTopAppBarTheme;
    return MediumTopAppBarTheme(
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MediumTopAppBarTheme &&
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
