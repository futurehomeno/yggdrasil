// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'callout_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCalloutThemes extends ThemeExtension<YgCalloutThemes> {
  const YgCalloutThemes({
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

  static final YgCalloutThemes consumerLight = YgCalloutThemes(
    borderRadius: _$YgCalloutThemes.borderRadius[0],
    closeButtonSpacing: _$YgCalloutThemes.closeButtonSpacing[0],
    criticalCalloutTheme: _$YgCalloutThemes.criticalCalloutTheme[0],
    descriptionTextStyle: _$YgCalloutThemes.descriptionTextStyle[0],
    highlightCalloutTheme: _$YgCalloutThemes.highlightCalloutTheme[0],
    linkSpacing: _$YgCalloutThemes.linkSpacing[0],
    padding: _$YgCalloutThemes.padding[0],
    successCalloutTheme: _$YgCalloutThemes.successCalloutTheme[0],
    titleSpacing: _$YgCalloutThemes.titleSpacing[0],
    titleTextStyle: _$YgCalloutThemes.titleTextStyle[0],
    warningCalloutTheme: _$YgCalloutThemes.warningCalloutTheme[0],
  );

  static final YgCalloutThemes consumerDark = YgCalloutThemes(
    borderRadius: _$YgCalloutThemes.borderRadius[1],
    closeButtonSpacing: _$YgCalloutThemes.closeButtonSpacing[1],
    criticalCalloutTheme: _$YgCalloutThemes.criticalCalloutTheme[1],
    descriptionTextStyle: _$YgCalloutThemes.descriptionTextStyle[1],
    highlightCalloutTheme: _$YgCalloutThemes.highlightCalloutTheme[1],
    linkSpacing: _$YgCalloutThemes.linkSpacing[1],
    padding: _$YgCalloutThemes.padding[1],
    successCalloutTheme: _$YgCalloutThemes.successCalloutTheme[1],
    titleSpacing: _$YgCalloutThemes.titleSpacing[1],
    titleTextStyle: _$YgCalloutThemes.titleTextStyle[1],
    warningCalloutTheme: _$YgCalloutThemes.warningCalloutTheme[1],
  );

  static final YgCalloutThemes professionalLight = YgCalloutThemes(
    borderRadius: _$YgCalloutThemes.borderRadius[2],
    closeButtonSpacing: _$YgCalloutThemes.closeButtonSpacing[2],
    criticalCalloutTheme: _$YgCalloutThemes.criticalCalloutTheme[2],
    descriptionTextStyle: _$YgCalloutThemes.descriptionTextStyle[2],
    highlightCalloutTheme: _$YgCalloutThemes.highlightCalloutTheme[2],
    linkSpacing: _$YgCalloutThemes.linkSpacing[2],
    padding: _$YgCalloutThemes.padding[2],
    successCalloutTheme: _$YgCalloutThemes.successCalloutTheme[2],
    titleSpacing: _$YgCalloutThemes.titleSpacing[2],
    titleTextStyle: _$YgCalloutThemes.titleTextStyle[2],
    warningCalloutTheme: _$YgCalloutThemes.warningCalloutTheme[2],
  );

  static final YgCalloutThemes professionalDark = YgCalloutThemes(
    borderRadius: _$YgCalloutThemes.borderRadius[3],
    closeButtonSpacing: _$YgCalloutThemes.closeButtonSpacing[3],
    criticalCalloutTheme: _$YgCalloutThemes.criticalCalloutTheme[3],
    descriptionTextStyle: _$YgCalloutThemes.descriptionTextStyle[3],
    highlightCalloutTheme: _$YgCalloutThemes.highlightCalloutTheme[3],
    linkSpacing: _$YgCalloutThemes.linkSpacing[3],
    padding: _$YgCalloutThemes.padding[3],
    successCalloutTheme: _$YgCalloutThemes.successCalloutTheme[3],
    titleSpacing: _$YgCalloutThemes.titleSpacing[3],
    titleTextStyle: _$YgCalloutThemes.titleTextStyle[3],
    warningCalloutTheme: _$YgCalloutThemes.warningCalloutTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCalloutThemes copyWith({
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
    return YgCalloutThemes(
      borderRadius: borderRadius ?? this.borderRadius,
      closeButtonSpacing: closeButtonSpacing ?? this.closeButtonSpacing,
      criticalCalloutTheme: criticalCalloutTheme ?? this.criticalCalloutTheme,
      descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      highlightCalloutTheme:
          highlightCalloutTheme ?? this.highlightCalloutTheme,
      linkSpacing: linkSpacing ?? this.linkSpacing,
      padding: padding ?? this.padding,
      successCalloutTheme: successCalloutTheme ?? this.successCalloutTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      warningCalloutTheme: warningCalloutTheme ?? this.warningCalloutTheme,
    );
  }

  @override
  YgCalloutThemes lerp(
      covariant ThemeExtension<YgCalloutThemes>? other, double t) {
    if (other is! YgCalloutThemes) return this as YgCalloutThemes;
    return YgCalloutThemes(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      closeButtonSpacing:
          t < 0.5 ? closeButtonSpacing : other.closeButtonSpacing,
      criticalCalloutTheme: criticalCalloutTheme.lerp(
          other.criticalCalloutTheme, t) as CriticalCalloutTheme,
      descriptionTextStyle:
          TextStyle.lerp(descriptionTextStyle, other.descriptionTextStyle, t)!,
      highlightCalloutTheme: highlightCalloutTheme.lerp(
          other.highlightCalloutTheme, t) as HighlightCalloutTheme,
      linkSpacing: t < 0.5 ? linkSpacing : other.linkSpacing,
      padding: t < 0.5 ? padding : other.padding,
      successCalloutTheme: successCalloutTheme.lerp(
          other.successCalloutTheme, t) as SuccessCalloutTheme,
      titleSpacing: t < 0.5 ? titleSpacing : other.titleSpacing,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      warningCalloutTheme: warningCalloutTheme.lerp(
          other.warningCalloutTheme, t) as WarningCalloutTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCalloutThemes &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(closeButtonSpacing, other.closeButtonSpacing) &&
            const DeepCollectionEquality()
                .equals(criticalCalloutTheme, other.criticalCalloutTheme) &&
            const DeepCollectionEquality()
                .equals(descriptionTextStyle, other.descriptionTextStyle) &&
            const DeepCollectionEquality()
                .equals(highlightCalloutTheme, other.highlightCalloutTheme) &&
            const DeepCollectionEquality()
                .equals(linkSpacing, other.linkSpacing) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(successCalloutTheme, other.successCalloutTheme) &&
            const DeepCollectionEquality()
                .equals(titleSpacing, other.titleSpacing) &&
            const DeepCollectionEquality()
                .equals(titleTextStyle, other.titleTextStyle) &&
            const DeepCollectionEquality()
                .equals(warningCalloutTheme, other.warningCalloutTheme));
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
