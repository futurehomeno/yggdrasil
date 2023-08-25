// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'checkbox_item_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCheckboxItemTheme extends ThemeExtension<YgCheckboxItemTheme> {
  const YgCheckboxItemTheme({
    required this.checkboxTitleSpacing,
    required this.titlePadding,
    required this.titleTextStyle,
  });

  final double checkboxTitleSpacing;
  final EdgeInsets titlePadding;
  final TextStyle titleTextStyle;

  static final YgCheckboxItemTheme consumerLight = YgCheckboxItemTheme(
    checkboxTitleSpacing: _$YgCheckboxItemTheme.checkboxTitleSpacing[0],
    titlePadding: _$YgCheckboxItemTheme.titlePadding[0],
    titleTextStyle: _$YgCheckboxItemTheme.titleTextStyle[0],
  );

  static final YgCheckboxItemTheme consumerDark = YgCheckboxItemTheme(
    checkboxTitleSpacing: _$YgCheckboxItemTheme.checkboxTitleSpacing[1],
    titlePadding: _$YgCheckboxItemTheme.titlePadding[1],
    titleTextStyle: _$YgCheckboxItemTheme.titleTextStyle[1],
  );

  static final YgCheckboxItemTheme professionalLight = YgCheckboxItemTheme(
    checkboxTitleSpacing: _$YgCheckboxItemTheme.checkboxTitleSpacing[2],
    titlePadding: _$YgCheckboxItemTheme.titlePadding[2],
    titleTextStyle: _$YgCheckboxItemTheme.titleTextStyle[2],
  );

  static final YgCheckboxItemTheme professionalDark = YgCheckboxItemTheme(
    checkboxTitleSpacing: _$YgCheckboxItemTheme.checkboxTitleSpacing[3],
    titlePadding: _$YgCheckboxItemTheme.titlePadding[3],
    titleTextStyle: _$YgCheckboxItemTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCheckboxItemTheme copyWith({
    double? checkboxTitleSpacing,
    EdgeInsets? titlePadding,
    TextStyle? titleTextStyle,
  }) {
    return YgCheckboxItemTheme(
      checkboxTitleSpacing: checkboxTitleSpacing ?? this.checkboxTitleSpacing,
      titlePadding: titlePadding ?? this.titlePadding,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgCheckboxItemTheme lerp(
      covariant ThemeExtension<YgCheckboxItemTheme>? other, double t) {
    if (other is! YgCheckboxItemTheme) return this as YgCheckboxItemTheme;
    return YgCheckboxItemTheme(
      checkboxTitleSpacing:
          t < 0.5 ? checkboxTitleSpacing : other.checkboxTitleSpacing,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCheckboxItemTheme &&
            const DeepCollectionEquality()
                .equals(checkboxTitleSpacing, other.checkboxTitleSpacing) &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(checkboxTitleSpacing),
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
