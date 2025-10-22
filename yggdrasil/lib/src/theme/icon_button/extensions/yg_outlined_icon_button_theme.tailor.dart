// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_outlined_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgOutlinedIconButtonTheme extends ThemeExtension<YgOutlinedIconButtonTheme> {
  const YgOutlinedIconButtonTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.disabledBackgroundColor,
    required this.disabledBorderColor,
    required this.disabledIconColor,
    required this.iconColor,
    required this.splashColor,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color disabledBackgroundColor;
  final Color disabledBorderColor;
  final Color disabledIconColor;
  final Color iconColor;
  final Color splashColor;

  static final YgOutlinedIconButtonTheme consumerLight = YgOutlinedIconButtonTheme(
    backgroundColor: _$YgOutlinedIconButtonTheme.backgroundColor[0],
    borderColor: _$YgOutlinedIconButtonTheme.borderColor[0],
    disabledBackgroundColor: _$YgOutlinedIconButtonTheme.disabledBackgroundColor[0],
    disabledBorderColor: _$YgOutlinedIconButtonTheme.disabledBorderColor[0],
    disabledIconColor: _$YgOutlinedIconButtonTheme.disabledIconColor[0],
    iconColor: _$YgOutlinedIconButtonTheme.iconColor[0],
    splashColor: _$YgOutlinedIconButtonTheme.splashColor[0],
  );

  static final YgOutlinedIconButtonTheme consumerDark = YgOutlinedIconButtonTheme(
    backgroundColor: _$YgOutlinedIconButtonTheme.backgroundColor[1],
    borderColor: _$YgOutlinedIconButtonTheme.borderColor[1],
    disabledBackgroundColor: _$YgOutlinedIconButtonTheme.disabledBackgroundColor[1],
    disabledBorderColor: _$YgOutlinedIconButtonTheme.disabledBorderColor[1],
    disabledIconColor: _$YgOutlinedIconButtonTheme.disabledIconColor[1],
    iconColor: _$YgOutlinedIconButtonTheme.iconColor[1],
    splashColor: _$YgOutlinedIconButtonTheme.splashColor[1],
  );

  static final YgOutlinedIconButtonTheme professionalLight = YgOutlinedIconButtonTheme(
    backgroundColor: _$YgOutlinedIconButtonTheme.backgroundColor[2],
    borderColor: _$YgOutlinedIconButtonTheme.borderColor[2],
    disabledBackgroundColor: _$YgOutlinedIconButtonTheme.disabledBackgroundColor[2],
    disabledBorderColor: _$YgOutlinedIconButtonTheme.disabledBorderColor[2],
    disabledIconColor: _$YgOutlinedIconButtonTheme.disabledIconColor[2],
    iconColor: _$YgOutlinedIconButtonTheme.iconColor[2],
    splashColor: _$YgOutlinedIconButtonTheme.splashColor[2],
  );

  static final YgOutlinedIconButtonTheme professionalDark = YgOutlinedIconButtonTheme(
    backgroundColor: _$YgOutlinedIconButtonTheme.backgroundColor[3],
    borderColor: _$YgOutlinedIconButtonTheme.borderColor[3],
    disabledBackgroundColor: _$YgOutlinedIconButtonTheme.disabledBackgroundColor[3],
    disabledBorderColor: _$YgOutlinedIconButtonTheme.disabledBorderColor[3],
    disabledIconColor: _$YgOutlinedIconButtonTheme.disabledIconColor[3],
    iconColor: _$YgOutlinedIconButtonTheme.iconColor[3],
    splashColor: _$YgOutlinedIconButtonTheme.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgOutlinedIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? disabledIconColor,
    Color? iconColor,
    Color? splashColor,
  }) {
    return YgOutlinedIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgOutlinedIconButtonTheme lerp(covariant ThemeExtension<YgOutlinedIconButtonTheme>? other, double t) {
    if (other is! YgOutlinedIconButtonTheme) return this as YgOutlinedIconButtonTheme;
    return YgOutlinedIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledBorderColor: Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      disabledIconColor: Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgOutlinedIconButtonTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality().equals(disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality().equals(disabledBorderColor, other.disabledBorderColor) &&
            const DeepCollectionEquality().equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(splashColor, other.splashColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(disabledBorderColor),
      const DeepCollectionEquality().hash(disabledIconColor),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(splashColor),
    );
  }
}
