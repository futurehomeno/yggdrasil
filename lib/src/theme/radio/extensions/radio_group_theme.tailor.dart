// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'radio_group_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgRadioGroupTheme extends ThemeExtension<YgRadioGroupTheme> {
  const YgRadioGroupTheme({
    required this.labelColumnSpacing,
    required this.labelTextStyle,
  });

  final double labelColumnSpacing;
  final TextStyle labelTextStyle;

  static final YgRadioGroupTheme consumerLight = YgRadioGroupTheme(
    labelColumnSpacing: _$YgRadioGroupTheme.labelColumnSpacing[0],
    labelTextStyle: _$YgRadioGroupTheme.labelTextStyle[0],
  );

  static final YgRadioGroupTheme consumerDark = YgRadioGroupTheme(
    labelColumnSpacing: _$YgRadioGroupTheme.labelColumnSpacing[1],
    labelTextStyle: _$YgRadioGroupTheme.labelTextStyle[1],
  );

  static final YgRadioGroupTheme professionalLight = YgRadioGroupTheme(
    labelColumnSpacing: _$YgRadioGroupTheme.labelColumnSpacing[2],
    labelTextStyle: _$YgRadioGroupTheme.labelTextStyle[2],
  );

  static final YgRadioGroupTheme professionalDark = YgRadioGroupTheme(
    labelColumnSpacing: _$YgRadioGroupTheme.labelColumnSpacing[3],
    labelTextStyle: _$YgRadioGroupTheme.labelTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgRadioGroupTheme copyWith({
    double? labelColumnSpacing,
    TextStyle? labelTextStyle,
  }) {
    return YgRadioGroupTheme(
      labelColumnSpacing: labelColumnSpacing ?? this.labelColumnSpacing,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  @override
  YgRadioGroupTheme lerp(
      covariant ThemeExtension<YgRadioGroupTheme>? other, double t) {
    if (other is! YgRadioGroupTheme) return this as YgRadioGroupTheme;
    return YgRadioGroupTheme(
      labelColumnSpacing:
          t < 0.5 ? labelColumnSpacing : other.labelColumnSpacing,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgRadioGroupTheme &&
            const DeepCollectionEquality()
                .equals(labelColumnSpacing, other.labelColumnSpacing) &&
            const DeepCollectionEquality()
                .equals(labelTextStyle, other.labelTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(labelColumnSpacing),
      const DeepCollectionEquality().hash(labelTextStyle),
    );
  }
}
