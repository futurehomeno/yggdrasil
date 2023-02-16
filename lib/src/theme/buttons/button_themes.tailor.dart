// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'button_themes.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgButtonThemes extends ThemeExtension<YgButtonThemes> {
  const YgButtonThemes({
    required this.primaryButtonTheme,
    required this.secondaryButtonTheme,
    required this.textButtonTheme,
    required this.buttonPadding,
  });

  final PrimaryButtonTheme primaryButtonTheme;
  final SecondaryButtonTheme secondaryButtonTheme;
  final TextButtonTheme textButtonTheme;
  final EdgeInsets buttonPadding;

  static final YgButtonThemes consumerLight = YgButtonThemes(
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[0],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[0],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[0],
    buttonPadding: _$YgButtonThemes.buttonPadding[0],
  );

  static final YgButtonThemes consumerDark = YgButtonThemes(
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[1],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[1],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[1],
    buttonPadding: _$YgButtonThemes.buttonPadding[1],
  );

  static final YgButtonThemes professionalLight = YgButtonThemes(
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[2],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[2],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[2],
    buttonPadding: _$YgButtonThemes.buttonPadding[2],
  );

  static final YgButtonThemes professionalDark = YgButtonThemes(
    primaryButtonTheme: _$YgButtonThemes.primaryButtonTheme[3],
    secondaryButtonTheme: _$YgButtonThemes.secondaryButtonTheme[3],
    textButtonTheme: _$YgButtonThemes.textButtonTheme[3],
    buttonPadding: _$YgButtonThemes.buttonPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgButtonThemes copyWith({
    PrimaryButtonTheme? primaryButtonTheme,
    SecondaryButtonTheme? secondaryButtonTheme,
    TextButtonTheme? textButtonTheme,
    EdgeInsets? buttonPadding,
  }) {
    return YgButtonThemes(
      primaryButtonTheme: primaryButtonTheme ?? this.primaryButtonTheme,
      secondaryButtonTheme: secondaryButtonTheme ?? this.secondaryButtonTheme,
      textButtonTheme: textButtonTheme ?? this.textButtonTheme,
      buttonPadding: buttonPadding ?? this.buttonPadding,
    );
  }

  @override
  YgButtonThemes lerp(ThemeExtension<YgButtonThemes>? other, double t) {
    if (other is! YgButtonThemes) return this;
    return YgButtonThemes(
      primaryButtonTheme: primaryButtonTheme.lerp(other.primaryButtonTheme, t),
      secondaryButtonTheme:
          secondaryButtonTheme.lerp(other.secondaryButtonTheme, t),
      textButtonTheme: textButtonTheme.lerp(other.textButtonTheme, t),
      buttonPadding: t < 0.5 ? buttonPadding : other.buttonPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgButtonThemes &&
            const DeepCollectionEquality()
                .equals(primaryButtonTheme, other.primaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(secondaryButtonTheme, other.secondaryButtonTheme) &&
            const DeepCollectionEquality()
                .equals(textButtonTheme, other.textButtonTheme) &&
            const DeepCollectionEquality()
                .equals(buttonPadding, other.buttonPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(primaryButtonTheme),
        const DeepCollectionEquality().hash(secondaryButtonTheme),
        const DeepCollectionEquality().hash(textButtonTheme),
        const DeepCollectionEquality().hash(buttonPadding));
  }
}

class PrimaryButtonTheme extends ThemeExtension<PrimaryButtonTheme> {
  const PrimaryButtonTheme({
    required this.textColor,
    required this.textStyle,
    required this.backgroundGradient,
  });

  final Color textColor;
  final TextStyle textStyle;
  final LinearGradient backgroundGradient;

  static final PrimaryButtonTheme consumerLight = PrimaryButtonTheme(
    textColor: _$PrimaryButtonTheme.textColor[0],
    textStyle: _$PrimaryButtonTheme.textStyle[0],
    backgroundGradient: _$PrimaryButtonTheme.backgroundGradient[0],
  );

  static final PrimaryButtonTheme consumerDark = PrimaryButtonTheme(
    textColor: _$PrimaryButtonTheme.textColor[1],
    textStyle: _$PrimaryButtonTheme.textStyle[1],
    backgroundGradient: _$PrimaryButtonTheme.backgroundGradient[1],
  );

  static final PrimaryButtonTheme professionalLight = PrimaryButtonTheme(
    textColor: _$PrimaryButtonTheme.textColor[2],
    textStyle: _$PrimaryButtonTheme.textStyle[2],
    backgroundGradient: _$PrimaryButtonTheme.backgroundGradient[2],
  );

  static final PrimaryButtonTheme professionalDark = PrimaryButtonTheme(
    textColor: _$PrimaryButtonTheme.textColor[3],
    textStyle: _$PrimaryButtonTheme.textStyle[3],
    backgroundGradient: _$PrimaryButtonTheme.backgroundGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  PrimaryButtonTheme copyWith({
    Color? textColor,
    TextStyle? textStyle,
    LinearGradient? backgroundGradient,
  }) {
    return PrimaryButtonTheme(
      textColor: textColor ?? this.textColor,
      textStyle: textStyle ?? this.textStyle,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  PrimaryButtonTheme lerp(ThemeExtension<PrimaryButtonTheme>? other, double t) {
    if (other is! PrimaryButtonTheme) return this;
    return PrimaryButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundGradient:
          t < 0.5 ? backgroundGradient : other.backgroundGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrimaryButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(backgroundGradient, other.backgroundGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(textColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(backgroundGradient));
  }
}

class SecondaryButtonTheme extends ThemeExtension<SecondaryButtonTheme> {
  const SecondaryButtonTheme({
    required this.textColor,
    required this.textStyle,
    required this.backgroundGradient,
  });

  final Color textColor;
  final TextStyle textStyle;
  final LinearGradient backgroundGradient;

  static final SecondaryButtonTheme consumerLight = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[0],
    textStyle: _$SecondaryButtonTheme.textStyle[0],
    backgroundGradient: _$SecondaryButtonTheme.backgroundGradient[0],
  );

  static final SecondaryButtonTheme consumerDark = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[1],
    textStyle: _$SecondaryButtonTheme.textStyle[1],
    backgroundGradient: _$SecondaryButtonTheme.backgroundGradient[1],
  );

  static final SecondaryButtonTheme professionalLight = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[2],
    textStyle: _$SecondaryButtonTheme.textStyle[2],
    backgroundGradient: _$SecondaryButtonTheme.backgroundGradient[2],
  );

  static final SecondaryButtonTheme professionalDark = SecondaryButtonTheme(
    textColor: _$SecondaryButtonTheme.textColor[3],
    textStyle: _$SecondaryButtonTheme.textStyle[3],
    backgroundGradient: _$SecondaryButtonTheme.backgroundGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SecondaryButtonTheme copyWith({
    Color? textColor,
    TextStyle? textStyle,
    LinearGradient? backgroundGradient,
  }) {
    return SecondaryButtonTheme(
      textColor: textColor ?? this.textColor,
      textStyle: textStyle ?? this.textStyle,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  SecondaryButtonTheme lerp(
      ThemeExtension<SecondaryButtonTheme>? other, double t) {
    if (other is! SecondaryButtonTheme) return this;
    return SecondaryButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundGradient:
          t < 0.5 ? backgroundGradient : other.backgroundGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SecondaryButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(backgroundGradient, other.backgroundGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(textColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(backgroundGradient));
  }
}

class TextButtonTheme extends ThemeExtension<TextButtonTheme> {
  const TextButtonTheme({
    required this.textColor,
    required this.textStyle,
    required this.backgroundGradient,
  });

  final Color textColor;
  final TextStyle textStyle;
  final LinearGradient backgroundGradient;

  static final TextButtonTheme consumerLight = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[0],
    textStyle: _$TextButtonTheme.textStyle[0],
    backgroundGradient: _$TextButtonTheme.backgroundGradient[0],
  );

  static final TextButtonTheme consumerDark = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[1],
    textStyle: _$TextButtonTheme.textStyle[1],
    backgroundGradient: _$TextButtonTheme.backgroundGradient[1],
  );

  static final TextButtonTheme professionalLight = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[2],
    textStyle: _$TextButtonTheme.textStyle[2],
    backgroundGradient: _$TextButtonTheme.backgroundGradient[2],
  );

  static final TextButtonTheme professionalDark = TextButtonTheme(
    textColor: _$TextButtonTheme.textColor[3],
    textStyle: _$TextButtonTheme.textStyle[3],
    backgroundGradient: _$TextButtonTheme.backgroundGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  TextButtonTheme copyWith({
    Color? textColor,
    TextStyle? textStyle,
    LinearGradient? backgroundGradient,
  }) {
    return TextButtonTheme(
      textColor: textColor ?? this.textColor,
      textStyle: textStyle ?? this.textStyle,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  TextButtonTheme lerp(ThemeExtension<TextButtonTheme>? other, double t) {
    if (other is! TextButtonTheme) return this;
    return TextButtonTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      backgroundGradient:
          t < 0.5 ? backgroundGradient : other.backgroundGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextButtonTheme &&
            const DeepCollectionEquality().equals(textColor, other.textColor) &&
            const DeepCollectionEquality().equals(textStyle, other.textStyle) &&
            const DeepCollectionEquality()
                .equals(backgroundGradient, other.backgroundGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(textColor),
        const DeepCollectionEquality().hash(textStyle),
        const DeepCollectionEquality().hash(backgroundGradient));
  }
}
