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
    required this.titlePadding,
    required this.titleTextStyle,
  });

  final double radioTitleSpacing;
  final EdgeInsets titlePadding;
  final TextStyle titleTextStyle;

  static final YgRadioItemTheme consumerLight = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[0],
    titlePadding: _$YgRadioItemTheme.titlePadding[0],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[0],
  );

  static final YgRadioItemTheme consumerDark = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[1],
    titlePadding: _$YgRadioItemTheme.titlePadding[1],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[1],
  );

  static final YgRadioItemTheme professionalLight = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[2],
    titlePadding: _$YgRadioItemTheme.titlePadding[2],
    titleTextStyle: _$YgRadioItemTheme.titleTextStyle[2],
  );

  static final YgRadioItemTheme professionalDark = YgRadioItemTheme(
    radioTitleSpacing: _$YgRadioItemTheme.radioTitleSpacing[3],
    titlePadding: _$YgRadioItemTheme.titlePadding[3],
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
    EdgeInsets? titlePadding,
    TextStyle? titleTextStyle,
  }) {
    return YgRadioItemTheme(
      radioTitleSpacing: radioTitleSpacing ?? this.radioTitleSpacing,
      titlePadding: titlePadding ?? this.titlePadding,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgRadioItemTheme lerp(covariant ThemeExtension<YgRadioItemTheme>? other, double t) {
    if (other is! YgRadioItemTheme) return this as YgRadioItemTheme;
    return YgRadioItemTheme(
      radioTitleSpacing: t < 0.5 ? radioTitleSpacing : other.radioTitleSpacing,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgRadioItemTheme &&
            const DeepCollectionEquality().equals(radioTitleSpacing, other.radioTitleSpacing) &&
            const DeepCollectionEquality().equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(radioTitleSpacing),
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
