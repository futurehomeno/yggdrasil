// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'snack_bar_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSnackBarTheme extends ThemeExtension<YgSnackBarTheme> {
  const YgSnackBarTheme({
    required this.backgroundColor,
    required this.borderRadius,
    required this.closeIconColor,
    required this.criticalSnackBarTheme,
    required this.highlightSnackBarTheme,
    required this.margin,
    required this.messageSpacing,
    required this.messageTextStyle,
    required this.padding,
    required this.successSnackBarTheme,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color closeIconColor;
  final CriticalSnackBarTheme criticalSnackBarTheme;
  final HighlightSnackBarTheme highlightSnackBarTheme;
  final EdgeInsets margin;
  final double messageSpacing;
  final TextStyle messageTextStyle;
  final EdgeInsets padding;
  final SuccessSnackBarTheme successSnackBarTheme;

  static final YgSnackBarTheme consumerLight = YgSnackBarTheme(
    backgroundColor: _$YgSnackBarTheme.backgroundColor[0],
    borderRadius: _$YgSnackBarTheme.borderRadius[0],
    closeIconColor: _$YgSnackBarTheme.closeIconColor[0],
    criticalSnackBarTheme: _$YgSnackBarTheme.criticalSnackBarTheme[0],
    highlightSnackBarTheme: _$YgSnackBarTheme.highlightSnackBarTheme[0],
    margin: _$YgSnackBarTheme.margin[0],
    messageSpacing: _$YgSnackBarTheme.messageSpacing[0],
    messageTextStyle: _$YgSnackBarTheme.messageTextStyle[0],
    padding: _$YgSnackBarTheme.padding[0],
    successSnackBarTheme: _$YgSnackBarTheme.successSnackBarTheme[0],
  );

  static final YgSnackBarTheme consumerDark = YgSnackBarTheme(
    backgroundColor: _$YgSnackBarTheme.backgroundColor[1],
    borderRadius: _$YgSnackBarTheme.borderRadius[1],
    closeIconColor: _$YgSnackBarTheme.closeIconColor[1],
    criticalSnackBarTheme: _$YgSnackBarTheme.criticalSnackBarTheme[1],
    highlightSnackBarTheme: _$YgSnackBarTheme.highlightSnackBarTheme[1],
    margin: _$YgSnackBarTheme.margin[1],
    messageSpacing: _$YgSnackBarTheme.messageSpacing[1],
    messageTextStyle: _$YgSnackBarTheme.messageTextStyle[1],
    padding: _$YgSnackBarTheme.padding[1],
    successSnackBarTheme: _$YgSnackBarTheme.successSnackBarTheme[1],
  );

  static final YgSnackBarTheme professionalLight = YgSnackBarTheme(
    backgroundColor: _$YgSnackBarTheme.backgroundColor[2],
    borderRadius: _$YgSnackBarTheme.borderRadius[2],
    closeIconColor: _$YgSnackBarTheme.closeIconColor[2],
    criticalSnackBarTheme: _$YgSnackBarTheme.criticalSnackBarTheme[2],
    highlightSnackBarTheme: _$YgSnackBarTheme.highlightSnackBarTheme[2],
    margin: _$YgSnackBarTheme.margin[2],
    messageSpacing: _$YgSnackBarTheme.messageSpacing[2],
    messageTextStyle: _$YgSnackBarTheme.messageTextStyle[2],
    padding: _$YgSnackBarTheme.padding[2],
    successSnackBarTheme: _$YgSnackBarTheme.successSnackBarTheme[2],
  );

  static final YgSnackBarTheme professionalDark = YgSnackBarTheme(
    backgroundColor: _$YgSnackBarTheme.backgroundColor[3],
    borderRadius: _$YgSnackBarTheme.borderRadius[3],
    closeIconColor: _$YgSnackBarTheme.closeIconColor[3],
    criticalSnackBarTheme: _$YgSnackBarTheme.criticalSnackBarTheme[3],
    highlightSnackBarTheme: _$YgSnackBarTheme.highlightSnackBarTheme[3],
    margin: _$YgSnackBarTheme.margin[3],
    messageSpacing: _$YgSnackBarTheme.messageSpacing[3],
    messageTextStyle: _$YgSnackBarTheme.messageTextStyle[3],
    padding: _$YgSnackBarTheme.padding[3],
    successSnackBarTheme: _$YgSnackBarTheme.successSnackBarTheme[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSnackBarTheme copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? closeIconColor,
    CriticalSnackBarTheme? criticalSnackBarTheme,
    HighlightSnackBarTheme? highlightSnackBarTheme,
    EdgeInsets? margin,
    double? messageSpacing,
    TextStyle? messageTextStyle,
    EdgeInsets? padding,
    SuccessSnackBarTheme? successSnackBarTheme,
  }) {
    return YgSnackBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      criticalSnackBarTheme:
          criticalSnackBarTheme ?? this.criticalSnackBarTheme,
      highlightSnackBarTheme:
          highlightSnackBarTheme ?? this.highlightSnackBarTheme,
      margin: margin ?? this.margin,
      messageSpacing: messageSpacing ?? this.messageSpacing,
      messageTextStyle: messageTextStyle ?? this.messageTextStyle,
      padding: padding ?? this.padding,
      successSnackBarTheme: successSnackBarTheme ?? this.successSnackBarTheme,
    );
  }

  @override
  YgSnackBarTheme lerp(
      covariant ThemeExtension<YgSnackBarTheme>? other, double t) {
    if (other is! YgSnackBarTheme) return this as YgSnackBarTheme;
    return YgSnackBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
      criticalSnackBarTheme: criticalSnackBarTheme.lerp(
          other.criticalSnackBarTheme, t) as CriticalSnackBarTheme,
      highlightSnackBarTheme: highlightSnackBarTheme.lerp(
          other.highlightSnackBarTheme, t) as HighlightSnackBarTheme,
      margin: t < 0.5 ? margin : other.margin,
      messageSpacing: t < 0.5 ? messageSpacing : other.messageSpacing,
      messageTextStyle:
          TextStyle.lerp(messageTextStyle, other.messageTextStyle, t)!,
      padding: t < 0.5 ? padding : other.padding,
      successSnackBarTheme: successSnackBarTheme.lerp(
          other.successSnackBarTheme, t) as SuccessSnackBarTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSnackBarTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(closeIconColor, other.closeIconColor) &&
            const DeepCollectionEquality()
                .equals(criticalSnackBarTheme, other.criticalSnackBarTheme) &&
            const DeepCollectionEquality()
                .equals(highlightSnackBarTheme, other.highlightSnackBarTheme) &&
            const DeepCollectionEquality().equals(margin, other.margin) &&
            const DeepCollectionEquality()
                .equals(messageSpacing, other.messageSpacing) &&
            const DeepCollectionEquality()
                .equals(messageTextStyle, other.messageTextStyle) &&
            const DeepCollectionEquality().equals(padding, other.padding) &&
            const DeepCollectionEquality()
                .equals(successSnackBarTheme, other.successSnackBarTheme));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(closeIconColor),
      const DeepCollectionEquality().hash(criticalSnackBarTheme),
      const DeepCollectionEquality().hash(highlightSnackBarTheme),
      const DeepCollectionEquality().hash(margin),
      const DeepCollectionEquality().hash(messageSpacing),
      const DeepCollectionEquality().hash(messageTextStyle),
      const DeepCollectionEquality().hash(padding),
      const DeepCollectionEquality().hash(successSnackBarTheme),
    );
  }
}
