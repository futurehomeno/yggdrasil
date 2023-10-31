// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_filled_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgFilledIconButtonTheme extends ThemeExtension<YgFilledIconButtonTheme> {
  const YgFilledIconButtonTheme({
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

  static final YgFilledIconButtonTheme consumerLight = YgFilledIconButtonTheme(
    backgroundColor: _$YgFilledIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor:
        _$YgFilledIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$YgFilledIconButtonTheme.disabledIconColor[0],
    iconColor: _$YgFilledIconButtonTheme.iconColor[0],
    splashColor: _$YgFilledIconButtonTheme.splashColor[0],
  );

  static final YgFilledIconButtonTheme consumerDark = YgFilledIconButtonTheme(
    backgroundColor: _$YgFilledIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor:
        _$YgFilledIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$YgFilledIconButtonTheme.disabledIconColor[1],
    iconColor: _$YgFilledIconButtonTheme.iconColor[1],
    splashColor: _$YgFilledIconButtonTheme.splashColor[1],
  );

  static final YgFilledIconButtonTheme professionalLight =
      YgFilledIconButtonTheme(
    backgroundColor: _$YgFilledIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor:
        _$YgFilledIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$YgFilledIconButtonTheme.disabledIconColor[2],
    iconColor: _$YgFilledIconButtonTheme.iconColor[2],
    splashColor: _$YgFilledIconButtonTheme.splashColor[2],
  );

  static final YgFilledIconButtonTheme professionalDark =
      YgFilledIconButtonTheme(
    backgroundColor: _$YgFilledIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor:
        _$YgFilledIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$YgFilledIconButtonTheme.disabledIconColor[3],
    iconColor: _$YgFilledIconButtonTheme.iconColor[3],
    splashColor: _$YgFilledIconButtonTheme.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgFilledIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
    Color? splashColor,
  }) {
    return YgFilledIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgFilledIconButtonTheme lerp(
      covariant ThemeExtension<YgFilledIconButtonTheme>? other, double t) {
    if (other is! YgFilledIconButtonTheme)
      return this as YgFilledIconButtonTheme;
    return YgFilledIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledIconColor:
          Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgFilledIconButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(splashColor, other.splashColor));
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
