// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'snackbar_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSnackbarThemes extends ThemeExtension<YgSnackbarThemes> {
  const YgSnackbarThemes({
    required this.backgroundColor,
    required this.borderRadius,
    required this.closeIconColor,
    required this.containerIconSpacing,
    required this.criticalSnackbarTheme,
    required this.highlightSnackbarTheme,
    required this.messageSpacing,
    required this.messageTextStyle,
    required this.padding,
    required this.successSnackbarTheme,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color closeIconColor;
  final double containerIconSpacing;
  final CriticalSnackbarTheme criticalSnackbarTheme;
  final HighlightSnackbarTheme highlightSnackbarTheme;
  final double messageSpacing;
  final TextStyle messageTextStyle;
  final EdgeInsets padding;
  final SuccessSnackbarTheme successSnackbarTheme;

  static final YgSnackbarThemes consumerLight = YgSnackbarThemes(
    backgroundColor: _$YgSnackbarThemes.backgroundColor[0],
    borderRadius: _$YgSnackbarThemes.borderRadius[0],
    closeIconColor: _$YgSnackbarThemes.closeIconColor[0],
    containerIconSpacing: _$YgSnackbarThemes.containerIconSpacing[0],
    criticalSnackbarTheme: _$YgSnackbarThemes.criticalSnackbarTheme[0],
    highlightSnackbarTheme: _$YgSnackbarThemes.highlightSnackbarTheme[0],
    messageSpacing: _$YgSnackbarThemes.messageSpacing[0],
    messageTextStyle: _$YgSnackbarThemes.messageTextStyle[0],
    padding: _$YgSnackbarThemes.padding[0],
    successSnackbarTheme: _$YgSnackbarThemes.successSnackbarTheme[0],
  );

  static final YgSnackbarThemes consumerDark = YgSnackbarThemes(
    backgroundColor: _$YgSnackbarThemes.backgroundColor[1],
    borderRadius: _$YgSnackbarThemes.borderRadius[1],
    closeIconColor: _$YgSnackbarThemes.closeIconColor[1],
    containerIconSpacing: _$YgSnackbarThemes.containerIconSpacing[1],
    criticalSnackbarTheme: _$YgSnackbarThemes.criticalSnackbarTheme[1],
    highlightSnackbarTheme: _$YgSnackbarThemes.highlightSnackbarTheme[1],
    messageSpacing: _$YgSnackbarThemes.messageSpacing[1],
    messageTextStyle: _$YgSnackbarThemes.messageTextStyle[1],
    padding: _$YgSnackbarThemes.padding[1],
    successSnackbarTheme: _$YgSnackbarThemes.successSnackbarTheme[1],
  );

  static final YgSnackbarThemes professionalLight = YgSnackbarThemes(
    backgroundColor: _$YgSnackbarThemes.backgroundColor[2],
    borderRadius: _$YgSnackbarThemes.borderRadius[2],
    closeIconColor: _$YgSnackbarThemes.closeIconColor[2],
    containerIconSpacing: _$YgSnackbarThemes.containerIconSpacing[2],
    criticalSnackbarTheme: _$YgSnackbarThemes.criticalSnackbarTheme[2],
    highlightSnackbarTheme: _$YgSnackbarThemes.highlightSnackbarTheme[2],
    messageSpacing: _$YgSnackbarThemes.messageSpacing[2],
    messageTextStyle: _$YgSnackbarThemes.messageTextStyle[2],
    padding: _$YgSnackbarThemes.padding[2],
    successSnackbarTheme: _$YgSnackbarThemes.successSnackbarTheme[2],
  );

  static final YgSnackbarThemes professionalDark = YgSnackbarThemes(
    backgroundColor: _$YgSnackbarThemes.backgroundColor[3],
    borderRadius: _$YgSnackbarThemes.borderRadius[3],
    closeIconColor: _$YgSnackbarThemes.closeIconColor[3],
    containerIconSpacing: _$YgSnackbarThemes.containerIconSpacing[3],
    criticalSnackbarTheme: _$YgSnackbarThemes.criticalSnackbarTheme[3],
    highlightSnackbarTheme: _$YgSnackbarThemes.highlightSnackbarTheme[3],
    messageSpacing: _$YgSnackbarThemes.messageSpacing[3],
    messageTextStyle: _$YgSnackbarThemes.messageTextStyle[3],
    padding: _$YgSnackbarThemes.padding[3],
    successSnackbarTheme: _$YgSnackbarThemes.successSnackbarTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSnackbarThemes copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? closeIconColor,
    double? containerIconSpacing,
    CriticalSnackbarTheme? criticalSnackbarTheme,
    HighlightSnackbarTheme? highlightSnackbarTheme,
    double? messageSpacing,
    TextStyle? messageTextStyle,
    EdgeInsets? padding,
    SuccessSnackbarTheme? successSnackbarTheme,
  }) {
    return YgSnackbarThemes(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      containerIconSpacing: containerIconSpacing ?? this.containerIconSpacing,
      criticalSnackbarTheme:
          criticalSnackbarTheme ?? this.criticalSnackbarTheme,
      highlightSnackbarTheme:
          highlightSnackbarTheme ?? this.highlightSnackbarTheme,
      messageSpacing: messageSpacing ?? this.messageSpacing,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      padding: padding ?? this.padding,
      successSnackbarTheme: successSnackbarTheme ?? this.successSnackbarTheme,
    );
  }

  @override
  YgSnackbarThemes lerp(
      covariant ThemeExtension<YgSnackbarThemes>? other, double t) {
    if (other is! YgSnackbarThemes) return this as YgSnackbarThemes;
    return YgSnackbarThemes(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
      containerIconSpacing:
          t < 0.5 ? containerIconSpacing : other.containerIconSpacing,
      criticalSnackbarTheme: criticalSnackbarTheme.lerp(
          other.criticalSnackbarTheme, t) as CriticalSnackbarTheme,
      highlightSnackbarTheme: highlightSnackbarTheme.lerp(
          other.highlightSnackbarTheme, t) as HighlightSnackbarTheme,
      messageSpacing: t < 0.5 ? messageSpacing : other.messageSpacing,
      messageTextStyle:
          TextStyle.lerp(messageTextStyle, other.messageTextStyle, t)!,
      padding: t < 0.5 ? padding : other.padding,
      successSnackbarTheme: successSnackbarTheme.lerp(
          other.successSnackbarTheme, t) as SuccessSnackbarTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSnackbarThemes &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(closeIconColor, other.closeIconColor) &&
            const DeepCollectionEquality()
                .equals(containerIconSpacing, other.containerIconSpacing) &&
            const DeepCollectionEquality()
                .equals(criticalSnackbarTheme, other.criticalSnackbarTheme) &&
            const DeepCollectionEquality()
                .equals(highlightSnackbarTheme, other.highlightSnackbarTheme) &&
            const DeepCollectionEquality()
                .equals(messageSpacing, other.messageSpacing) &&
            const DeepCollectionEquality()
                .equals(messageTextStyle, other.messageTextStyle) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(successSnackbarTheme, other.successSnackbarTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(closeIconColor),
      const DeepCollectionEquality().hash(containerIconSpacing),
      const DeepCollectionEquality().hash(criticalSnackbarTheme),
      const DeepCollectionEquality().hash(highlightSnackbarTheme),
      const DeepCollectionEquality().hash(messageSpacing),
      const DeepCollectionEquality().hash(messageTextStyle),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(successSnackbarTheme),
    );
  }
}
