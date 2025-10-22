// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_standard_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgStandardIconButtonTheme extends ThemeExtension<YgStandardIconButtonTheme> {
  const YgStandardIconButtonTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
    required this.splashColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;
  final Color splashColor;

  static final YgStandardIconButtonTheme consumerLight = YgStandardIconButtonTheme(
    backgroundColor: _$YgStandardIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgStandardIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$YgStandardIconButtonTheme.disabledIconColor[0],
    iconColor: _$YgStandardIconButtonTheme.iconColor[0],
    splashColor: _$YgStandardIconButtonTheme.splashColor[0],
  );

  static final YgStandardIconButtonTheme consumerDark = YgStandardIconButtonTheme(
    backgroundColor: _$YgStandardIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgStandardIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$YgStandardIconButtonTheme.disabledIconColor[1],
    iconColor: _$YgStandardIconButtonTheme.iconColor[1],
    splashColor: _$YgStandardIconButtonTheme.splashColor[1],
  );

  static final YgStandardIconButtonTheme professionalLight = YgStandardIconButtonTheme(
    backgroundColor: _$YgStandardIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgStandardIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$YgStandardIconButtonTheme.disabledIconColor[2],
    iconColor: _$YgStandardIconButtonTheme.iconColor[2],
    splashColor: _$YgStandardIconButtonTheme.splashColor[2],
  );

  static final YgStandardIconButtonTheme professionalDark = YgStandardIconButtonTheme(
    backgroundColor: _$YgStandardIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgStandardIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$YgStandardIconButtonTheme.disabledIconColor[3],
    iconColor: _$YgStandardIconButtonTheme.iconColor[3],
    splashColor: _$YgStandardIconButtonTheme.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgStandardIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
    Color? splashColor,
  }) {
    return YgStandardIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgStandardIconButtonTheme lerp(covariant ThemeExtension<YgStandardIconButtonTheme>? other, double t) {
    if (other is! YgStandardIconButtonTheme) return this as YgStandardIconButtonTheme;
    return YgStandardIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledIconColor: Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgStandardIconButtonTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality().equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(splashColor, other.splashColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(disabledIconColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(splashColor),
    );
  }
}
