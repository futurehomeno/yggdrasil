// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'radio_item_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgRadioItemTheme extends ThemeExtension<YgRadioItemTheme> {
  const YgRadioItemTheme({
    required this.radioTitleSpacing,
    required this.titleTextStyle,
  });

  final double radioTitleSpacing;
  final TextStyle titleTextStyle;

  static final YgRadioItemTheme consumerLight = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[0],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[0],
  );

  static final YgRadioItemTheme consumerDark = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[1],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[1],
  );

  static final YgRadioItemTheme professionalLight = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[2],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[2],
  );

  static final YgRadioItemTheme professionalDark = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[3],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgRadioItemTheme copyWith({
    double? radioTitleSpacing,
    TextStyle? titleTextStyle,
  }) {
    return YgRadioItemTheme(
      radioTitleSpacing: radioTitleSpacing ?? this.radioTitleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgRadioItemTheme lerp(covariant ThemeExtension<YgRadioItemTheme>? other, double t) {
    if (other is! YgRadioItemTheme) return this as YgRadioItemTheme;
    return YgRadioItemTheme(
      radioTitleSpacing: t < 0.5 ? radioTitleSpacing : other.radioTitleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgRadioItemTheme &&
            const DeepCollectionEquality().equals(radioTitleSpacing, other.radioTitleSpacing) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(radioTitleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
