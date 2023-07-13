// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'snackbar_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSnackbarTheme extends ThemeExtension<YgSnackbarTheme> {
  const YgSnackbarTheme({
    required this.backgroundColor,
    required this.borderRadius,
    required this.closeIconColor,
    required this.criticalSnackbarTheme,
    required this.highlightSnackbarTheme,
    required this.iconContainerPadding,
    required this.messageSpacing,
    required this.messageTextStyle,
    required this.padding,
    required this.successSnackbarTheme,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color closeIconColor;
  final CriticalSnackbarTheme criticalSnackbarTheme;
  final HighlightSnackbarTheme highlightSnackbarTheme;
  final EdgeInsets iconContainerPadding;
  final double messageSpacing;
  final TextStyle messageTextStyle;
  final EdgeInsets padding;
  final SuccessSnackbarTheme successSnackbarTheme;

  static final YgSnackbarTheme consumerLight = YgSnackbarTheme(
    backgroundColor: _$YgSnackbarTheme.backgroundColor[0],
    borderRadius: _$YgSnackbarTheme.borderRadius[0],
    closeIconColor: _$YgSnackbarTheme.closeIconColor[0],
    criticalSnackbarTheme: _$YgSnackbarTheme.criticalSnackbarTheme[0],
    highlightSnackbarTheme: _$YgSnackbarTheme.highlightSnackbarTheme[0],
    iconContainerPadding: _$YgSnackbarTheme.iconContainerPadding[0],
    messageSpacing: _$YgSnackbarTheme.messageSpacing[0],
    messageTextStyle: _$YgSnackbarTheme.messageTextStyle[0],
    padding: _$YgSnackbarTheme.padding[0],
    successSnackbarTheme: _$YgSnackbarTheme.successSnackbarTheme[0],
  );

  static final YgSnackbarTheme consumerDark = YgSnackbarTheme(
    backgroundColor: _$YgSnackbarTheme.backgroundColor[1],
    borderRadius: _$YgSnackbarTheme.borderRadius[1],
    closeIconColor: _$YgSnackbarTheme.closeIconColor[1],
    criticalSnackbarTheme: _$YgSnackbarTheme.criticalSnackbarTheme[1],
    highlightSnackbarTheme: _$YgSnackbarTheme.highlightSnackbarTheme[1],
    iconContainerPadding: _$YgSnackbarTheme.iconContainerPadding[1],
    messageSpacing: _$YgSnackbarTheme.messageSpacing[1],
    messageTextStyle: _$YgSnackbarTheme.messageTextStyle[1],
    padding: _$YgSnackbarTheme.padding[1],
    successSnackbarTheme: _$YgSnackbarTheme.successSnackbarTheme[1],
  );

  static final YgSnackbarTheme professionalLight = YgSnackbarTheme(
    backgroundColor: _$YgSnackbarTheme.backgroundColor[2],
    borderRadius: _$YgSnackbarTheme.borderRadius[2],
    closeIconColor: _$YgSnackbarTheme.closeIconColor[2],
    criticalSnackbarTheme: _$YgSnackbarTheme.criticalSnackbarTheme[2],
    highlightSnackbarTheme: _$YgSnackbarTheme.highlightSnackbarTheme[2],
    iconContainerPadding: _$YgSnackbarTheme.iconContainerPadding[2],
    messageSpacing: _$YgSnackbarTheme.messageSpacing[2],
    messageTextStyle: _$YgSnackbarTheme.messageTextStyle[2],
    padding: _$YgSnackbarTheme.padding[2],
    successSnackbarTheme: _$YgSnackbarTheme.successSnackbarTheme[2],
  );

  static final YgSnackbarTheme professionalDark = YgSnackbarTheme(
    backgroundColor: _$YgSnackbarTheme.backgroundColor[3],
    borderRadius: _$YgSnackbarTheme.borderRadius[3],
    closeIconColor: _$YgSnackbarTheme.closeIconColor[3],
    criticalSnackbarTheme: _$YgSnackbarTheme.criticalSnackbarTheme[3],
    highlightSnackbarTheme: _$YgSnackbarTheme.highlightSnackbarTheme[3],
    iconContainerPadding: _$YgSnackbarTheme.iconContainerPadding[3],
    messageSpacing: _$YgSnackbarTheme.messageSpacing[3],
    messageTextStyle: _$YgSnackbarTheme.messageTextStyle[3],
    padding: _$YgSnackbarTheme.padding[3],
    successSnackbarTheme: _$YgSnackbarTheme.successSnackbarTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSnackbarTheme copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? closeIconColor,
    CriticalSnackbarTheme? criticalSnackbarTheme,
    HighlightSnackbarTheme? highlightSnackbarTheme,
    EdgeInsets? iconContainerPadding,
    double? messageSpacing,
    TextStyle? messageTextStyle,
    EdgeInsets? padding,
    SuccessSnackbarTheme? successSnackbarTheme,
  }) {
    return YgSnackbarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      criticalSnackbarTheme:
          criticalSnackbarTheme ?? this.criticalSnackbarTheme,
      highlightSnackbarTheme:
          highlightSnackbarTheme ?? this.highlightSnackbarTheme,
      iconContainerPadding: iconContainerPadding ?? this.iconContainerPadding,
      messageSpacing: messageSpacing ?? this.messageSpacing,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      padding: padding ?? this.padding,
      successSnackbarTheme: successSnackbarTheme ?? this.successSnackbarTheme,
    );
  }

  @override
  YgSnackbarTheme lerp(
      covariant ThemeExtension<YgSnackbarTheme>? other, double t) {
    if (other is! YgSnackbarTheme) return this as YgSnackbarTheme;
    return YgSnackbarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
      criticalSnackbarTheme: criticalSnackbarTheme.lerp(
          other.criticalSnackbarTheme, t) as CriticalSnackbarTheme,
      highlightSnackbarTheme: highlightSnackbarTheme.lerp(
          other.highlightSnackbarTheme, t) as HighlightSnackbarTheme,
      iconContainerPadding:
          t < 0.5 ? iconContainerPadding : other.iconContainerPadding,
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
            other is YgSnackbarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(closeIconColor, other.closeIconColor) &&
            const DeepCollectionEquality()
                .equals(criticalSnackbarTheme, other.criticalSnackbarTheme) &&
            const DeepCollectionEquality()
                .equals(highlightSnackbarTheme, other.highlightSnackbarTheme) &&
            const DeepCollectionEquality()
                .equals(iconContainerPadding, other.iconContainerPadding) &&
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
      const DeepCollectionEquality().hash(criticalSnackbarTheme),
      const DeepCollectionEquality().hash(highlightSnackbarTheme),
      const DeepCollectionEquality().hash(iconContainerPadding),
      const DeepCollectionEquality().hash(messageSpacing),
      const DeepCollectionEquality().hash(messageTextStyle),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(successSnackbarTheme),
    );
  }
}
