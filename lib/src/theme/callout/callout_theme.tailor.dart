// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'callout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCalloutTheme extends ThemeExtension<YgCalloutTheme> {
  const YgCalloutTheme({
    required this.borderRadius,
    required this.closeButtonSpacing,
    required this.criticalCalloutTheme,
    required this.descriptionTextStyle,
    required this.highlightCalloutTheme,
    required this.linkSpacing,
    required this.padding,
    required this.successCalloutTheme,
    required this.titleSpacing,
    required this.titleTextStyle,
    required this.warningCalloutTheme,
  });

  final BorderRadius borderRadius;
  final double closeButtonSpacing;
  final CriticalCalloutTheme criticalCalloutTheme;
  final TextStyle descriptionTextStyle;
  final HighlightCalloutTheme highlightCalloutTheme;
  final double linkSpacing;
  final EdgeInsets padding;
  final SuccessCalloutTheme successCalloutTheme;
  final double titleSpacing;
  final TextStyle titleTextStyle;
  final WarningCalloutTheme warningCalloutTheme;

  static final YgCalloutTheme consumerLight = YgCalloutTheme(
    borderRadius: _$YgCalloutTheme.borderRadius[0],
    closeButtonSpacing: _$YgCalloutTheme.closeButtonSpacing[0],
    criticalCalloutTheme: _$YgCalloutTheme.criticalCalloutTheme[0],
    descriptionTextStyle: _$YgCalloutTheme.descriptionTextStyle[0],
    highlightCalloutTheme: _$YgCalloutTheme.highlightCalloutTheme[0],
    linkSpacing: _$YgCalloutTheme.linkSpacing[0],
    padding: _$YgCalloutTheme.padding[0],
    successCalloutTheme: _$YgCalloutTheme.successCalloutTheme[0],
    titleSpacing: _$YgCalloutTheme.titleSpacing[0],
    titleTextStyle: _$YgCalloutTheme.titleTextStyle[0],
    warningCalloutTheme: _$YgCalloutTheme.warningCalloutTheme[0],
  );

  static final YgCalloutTheme consumerDark = YgCalloutTheme(
    borderRadius: _$YgCalloutTheme.borderRadius[1],
    closeButtonSpacing: _$YgCalloutTheme.closeButtonSpacing[1],
    criticalCalloutTheme: _$YgCalloutTheme.criticalCalloutTheme[1],
    descriptionTextStyle: _$YgCalloutTheme.descriptionTextStyle[1],
    highlightCalloutTheme: _$YgCalloutTheme.highlightCalloutTheme[1],
    linkSpacing: _$YgCalloutTheme.linkSpacing[1],
    padding: _$YgCalloutTheme.padding[1],
    successCalloutTheme: _$YgCalloutTheme.successCalloutTheme[1],
    titleSpacing: _$YgCalloutTheme.titleSpacing[1],
    titleTextStyle: _$YgCalloutTheme.titleTextStyle[1],
    warningCalloutTheme: _$YgCalloutTheme.warningCalloutTheme[1],
  );

  static final YgCalloutTheme professionalLight = YgCalloutTheme(
    borderRadius: _$YgCalloutTheme.borderRadius[2],
    closeButtonSpacing: _$YgCalloutTheme.closeButtonSpacing[2],
    criticalCalloutTheme: _$YgCalloutTheme.criticalCalloutTheme[2],
    descriptionTextStyle: _$YgCalloutTheme.descriptionTextStyle[2],
    highlightCalloutTheme: _$YgCalloutTheme.highlightCalloutTheme[2],
    linkSpacing: _$YgCalloutTheme.linkSpacing[2],
    padding: _$YgCalloutTheme.padding[2],
    successCalloutTheme: _$YgCalloutTheme.successCalloutTheme[2],
    titleSpacing: _$YgCalloutTheme.titleSpacing[2],
    titleTextStyle: _$YgCalloutTheme.titleTextStyle[2],
    warningCalloutTheme: _$YgCalloutTheme.warningCalloutTheme[2],
  );

  static final YgCalloutTheme professionalDark = YgCalloutTheme(
    borderRadius: _$YgCalloutTheme.borderRadius[3],
    closeButtonSpacing: _$YgCalloutTheme.closeButtonSpacing[3],
    criticalCalloutTheme: _$YgCalloutTheme.criticalCalloutTheme[3],
    descriptionTextStyle: _$YgCalloutTheme.descriptionTextStyle[3],
    highlightCalloutTheme: _$YgCalloutTheme.highlightCalloutTheme[3],
    linkSpacing: _$YgCalloutTheme.linkSpacing[3],
    padding: _$YgCalloutTheme.padding[3],
    successCalloutTheme: _$YgCalloutTheme.successCalloutTheme[3],
    titleSpacing: _$YgCalloutTheme.titleSpacing[3],
    titleTextStyle: _$YgCalloutTheme.titleTextStyle[3],
    warningCalloutTheme: _$YgCalloutTheme.warningCalloutTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCalloutTheme copyWith({
    BorderRadius? borderRadius,
    double? closeButtonSpacing,
    CriticalCalloutTheme? criticalCalloutTheme,
    TextStyle? descriptionTextStyle,
    HighlightCalloutTheme? highlightCalloutTheme,
    double? linkSpacing,
    EdgeInsets? padding,
    SuccessCalloutTheme? successCalloutTheme,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    WarningCalloutTheme? warningCalloutTheme,
  }) {
    return YgCalloutTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      closeButtonSpacing: closeButtonSpacing ?? this.closeButtonSpacing,
      criticalCalloutTheme: criticalCalloutTheme ?? this.criticalCalloutTheme,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      highlightCalloutTheme: highlightCalloutTheme ?? this.highlightCalloutTheme,
      linkSpacing: linkSpacing ?? this.linkSpacing,
      padding: padding ?? this.padding,
      successCalloutTheme: successCalloutTheme ?? this.successCalloutTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      warningCalloutTheme: warningCalloutTheme ?? this.warningCalloutTheme,
    );
  }

  @override
  YgCalloutTheme lerp(covariant ThemeExtension<YgCalloutTheme>? other, double t) {
    if (other is! YgCalloutTheme) return this as YgCalloutTheme;
    return YgCalloutTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      closeButtonSpacing: t < 0.5 ? closeButtonSpacing : other.closeButtonSpacing,
      criticalCalloutTheme: criticalCalloutTheme.lerp(other.criticalCalloutTheme, t) as CriticalCalloutTheme,
      descriptionTextStyle: TextStyle.lerp(descriptionTextStyle, other.descriptionTextStyle, t)!,
      highlightCalloutTheme: highlightCalloutTheme.lerp(other.highlightCalloutTheme, t) as HighlightCalloutTheme,
      linkSpacing: t < 0.5 ? linkSpacing : other.linkSpacing,
      padding: t < 0.5 ? padding : other.padding,
      successCalloutTheme: successCalloutTheme.lerp(other.successCalloutTheme, t) as SuccessCalloutTheme,
      titleSpacing: t < 0.5 ? titleSpacing : other.titleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      warningCalloutTheme: warningCalloutTheme.lerp(other.warningCalloutTheme, t) as WarningCalloutTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCalloutTheme &&
            const DeepCollectionEquality().equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality().equals(closeButtonSpacing, other.closeButtonSpacing) &&
            const DeepCollectionEquality().equals(criticalCalloutTheme, other.criticalCalloutTheme) &&
            const DeepCollectionEquality().equals(descriptionTextStyle, other.descriptionTextStyle) &&
            const DeepCollectionEquality().equals(highlightCalloutTheme, other.highlightCalloutTheme) &&
            const DeepCollectionEquality().equals(linkSpacing, other.linkSpacing) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality().equals(successCalloutTheme, other.successCalloutTheme) &&
            const DeepCollectionEquality().equals(titleSpacing, other.titleSpacing) &&
            const DeepCollectionEquality().equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality().equals(warningCalloutTheme, other.warningCalloutTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(closeButtonSpacing),
      const DeepCollectionEquality().hash(criticalCalloutTheme),
      const DeepCollectionEquality().hash(descriptionTextStyle),
      const DeepCollectionEquality().hash(highlightCalloutTheme),
      const DeepCollectionEquality().hash(linkSpacing),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(successCalloutTheme),
      const DeepCollectionEquality().hash(titleSpacing),
      const DeepCollectionEquality().hash(titleTextStyle),
      const DeepCollectionEquality().hash(warningCalloutTheme),
    );
  }
}
