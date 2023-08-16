// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'checkbox_group_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCheckboxGroupTheme extends ThemeExtension<YgCheckboxGroupTheme> {
  const YgCheckboxGroupTheme({
    required this.labelColumnSpacing,
    required this.labelTextStyle,
  });

  final double labelColumnSpacing;
  final TextStyle labelTextStyle;

  static final YgCheckboxGroupTheme consumerLight = YgCheckboxGroupTheme(
    labelColumnSpacing: _$YgCheckboxGroupTheme.labelColumnSpacing[0],
    labelTextStyle: _$YgCheckboxGroupTheme.labelTextStyle[0],
  );

  static final YgCheckboxGroupTheme consumerDark = YgCheckboxGroupTheme(
    labelColumnSpacing: _$YgCheckboxGroupTheme.labelColumnSpacing[1],
    labelTextStyle: _$YgCheckboxGroupTheme.labelTextStyle[1],
  );

  static final YgCheckboxGroupTheme professionalLight = YgCheckboxGroupTheme(
    labelColumnSpacing: _$YgCheckboxGroupTheme.labelColumnSpacing[2],
    labelTextStyle: _$YgCheckboxGroupTheme.labelTextStyle[2],
  );

  static final YgCheckboxGroupTheme professionalDark = YgCheckboxGroupTheme(
    labelColumnSpacing: _$YgCheckboxGroupTheme.labelColumnSpacing[3],
    labelTextStyle: _$YgCheckboxGroupTheme.labelTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCheckboxGroupTheme copyWith({
    double? labelColumnSpacing,
    TextStyle? labelTextStyle,
  }) {
    return YgCheckboxGroupTheme(
      labelColumnSpacing: labelColumnSpacing ?? this.labelColumnSpacing,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
    );
  }

  @override
  YgCheckboxGroupTheme lerp(
      covariant ThemeExtension<YgCheckboxGroupTheme>? other, double t) {
    if (other is! YgCheckboxGroupTheme) return this as YgCheckboxGroupTheme;
    return YgCheckboxGroupTheme(
      labelColumnSpacing:
          t < 0.5 ? labelColumnSpacing : other.labelColumnSpacing,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCheckboxGroupTheme &&
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
