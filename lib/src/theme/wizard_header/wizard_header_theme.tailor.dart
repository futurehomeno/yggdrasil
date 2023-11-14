// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'wizard_header_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgWizardHeaderTheme extends ThemeExtension<YgWizardHeaderTheme> {
  const YgWizardHeaderTheme({
    required this.backgroundColor,
    required this.barBackgroundColor,
    required this.barForegroundColor,
    required this.barPadding,
    required this.barSegmentGap,
    required this.barStroke,
    required this.counterTextStyle,
    required this.padding,
    required this.titlePadding,
    required this.titleTextStyle,
  });

  final Color backgroundColor;
  final Color barBackgroundColor;
  final Color barForegroundColor;
  final EdgeInsets barPadding;
  final double barSegmentGap;
  final double barStroke;
  final TextStyle counterTextStyle;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final TextStyle titleTextStyle;

  static final YgWizardHeaderTheme consumerLight = YgWizardHeaderTheme(
    backgroundColor: _$YgWizardHeaderTheme.backgroundColor[0],
    barBackgroundColor: _$YgWizardHeaderTheme.barBackgroundColor[0],
    barForegroundColor: _$YgWizardHeaderTheme.barForegroundColor[0],
    barPadding: _$YgWizardHeaderTheme.barPadding[0],
    barSegmentGap: _$YgWizardHeaderTheme.barSegmentGap[0],
    barStroke: _$YgWizardHeaderTheme.barStroke[0],
    counterTextStyle: _$YgWizardHeaderTheme.counterTextStyle[0],
    padding: _$YgWizardHeaderTheme.padding[0],
    titlePadding: _$YgWizardHeaderTheme.titlePadding[0],
    titleTextStyle: _$YgWizardHeaderTheme.titleTextStyle[0],
  );

  static final YgWizardHeaderTheme consumerDark = YgWizardHeaderTheme(
    backgroundColor: _$YgWizardHeaderTheme.backgroundColor[1],
    barBackgroundColor: _$YgWizardHeaderTheme.barBackgroundColor[1],
    barForegroundColor: _$YgWizardHeaderTheme.barForegroundColor[1],
    barPadding: _$YgWizardHeaderTheme.barPadding[1],
    barSegmentGap: _$YgWizardHeaderTheme.barSegmentGap[1],
    barStroke: _$YgWizardHeaderTheme.barStroke[1],
    counterTextStyle: _$YgWizardHeaderTheme.counterTextStyle[1],
    padding: _$YgWizardHeaderTheme.padding[1],
    titlePadding: _$YgWizardHeaderTheme.titlePadding[1],
    titleTextStyle: _$YgWizardHeaderTheme.titleTextStyle[1],
  );

  static final YgWizardHeaderTheme professionalLight = YgWizardHeaderTheme(
    backgroundColor: _$YgWizardHeaderTheme.backgroundColor[2],
    barBackgroundColor: _$YgWizardHeaderTheme.barBackgroundColor[2],
    barForegroundColor: _$YgWizardHeaderTheme.barForegroundColor[2],
    barPadding: _$YgWizardHeaderTheme.barPadding[2],
    barSegmentGap: _$YgWizardHeaderTheme.barSegmentGap[2],
    barStroke: _$YgWizardHeaderTheme.barStroke[2],
    counterTextStyle: _$YgWizardHeaderTheme.counterTextStyle[2],
    padding: _$YgWizardHeaderTheme.padding[2],
    titlePadding: _$YgWizardHeaderTheme.titlePadding[2],
    titleTextStyle: _$YgWizardHeaderTheme.titleTextStyle[2],
  );

  static final YgWizardHeaderTheme professionalDark = YgWizardHeaderTheme(
    backgroundColor: _$YgWizardHeaderTheme.backgroundColor[3],
    barBackgroundColor: _$YgWizardHeaderTheme.barBackgroundColor[3],
    barForegroundColor: _$YgWizardHeaderTheme.barForegroundColor[3],
    barPadding: _$YgWizardHeaderTheme.barPadding[3],
    barSegmentGap: _$YgWizardHeaderTheme.barSegmentGap[3],
    barStroke: _$YgWizardHeaderTheme.barStroke[3],
    counterTextStyle: _$YgWizardHeaderTheme.counterTextStyle[3],
    padding: _$YgWizardHeaderTheme.padding[3],
    titlePadding: _$YgWizardHeaderTheme.titlePadding[3],
    titleTextStyle: _$YgWizardHeaderTheme.titleTextStyle[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgWizardHeaderTheme copyWith({
    Color? backgroundColor,
    Color? barBackgroundColor,
    Color? barForegroundColor,
    EdgeInsets? barPadding,
    double? barSegmentGap,
    double? barStroke,
    TextStyle? counterTextStyle,
    EdgeInsets? padding,
    EdgeInsets? titlePadding,
    TextStyle? titleTextStyle,
  }) {
    return YgWizardHeaderTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barBackgroundColor: barBackgroundColor ?? this.barBackgroundColor,
      barForegroundColor: barForegroundColor ?? this.barForegroundColor,
      barPadding: barPadding ?? this.barPadding,
      barSegmentGap: barSegmentGap ?? this.barSegmentGap,
      barStroke: barStroke ?? this.barStroke,
      counterTextStyle: counterTextStyle ?? this.counterTextStyle,
      padding: padding ?? this.padding,
      titlePadding: titlePadding ?? this.titlePadding,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  YgWizardHeaderTheme lerp(
      covariant ThemeExtension<YgWizardHeaderTheme>? other, double t) {
    if (other is! YgWizardHeaderTheme) return this as YgWizardHeaderTheme;
    return YgWizardHeaderTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      barBackgroundColor:
          Color.lerp(barBackgroundColor, other.barBackgroundColor, t)!,
      barForegroundColor:
          Color.lerp(barForegroundColor, other.barForegroundColor, t)!,
      barPadding: t < 0.5 ? barPadding : other.barPadding,
      barSegmentGap: t < 0.5 ? barSegmentGap : other.barSegmentGap,
      barStroke: t < 0.5 ? barStroke : other.barStroke,
      counterTextStyle:
          TextStyle.lerp(counterTextStyle, other.counterTextStyle, t)!,
      padding: t < 0.5 ? padding : other.padding,
      titlePadding: t < 0.5 ? titlePadding : other.titlePadding,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgWizardHeaderTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(barBackgroundColor, other.barBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(barForegroundColor, other.barForegroundColor) &&
            const DeepCollectionEquality()
                .equals(barPadding, other.barPadding) &&
            const DeepCollectionEquality()
                .equals(barSegmentGap, other.barSegmentGap) &&
            const DeepCollectionEquality().equals(barStroke, other.barStroke) &&
            const DeepCollectionEquality()
                .equals(counterTextStyle, other.counterTextStyle) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(titlePadding, other.titlePadding) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(barBackgroundColor),
      const DeepCollectionEquality().hash(barForegroundColor),
      const DeepCollectionEquality().hash(barPadding),
      const DeepCollectionEquality().hash(barSegmentGap),
      const DeepCollectionEquality().hash(barStroke),
      const DeepCollectionEquality().hash(counterTextStyle),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(titlePadding),
      const DeepCollectionEquality().hash(titleTextStyle),
    );
  }
}
