// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_tonal_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgTonalIconButtonTheme extends ThemeExtension<YgTonalIconButtonTheme> {
  const YgTonalIconButtonTheme({
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

  static final YgTonalIconButtonTheme consumerLight = YgTonalIconButtonTheme(
    backgroundColor: _$YgTonalIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor: _$YgTonalIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$YgTonalIconButtonTheme.disabledIconColor[0],
    iconColor: _$YgTonalIconButtonTheme.iconColor[0],
    splashColor: _$YgTonalIconButtonTheme.splashColor[0],
  );

  static final YgTonalIconButtonTheme consumerDark = YgTonalIconButtonTheme(
    backgroundColor: _$YgTonalIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor: _$YgTonalIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$YgTonalIconButtonTheme.disabledIconColor[1],
    iconColor: _$YgTonalIconButtonTheme.iconColor[1],
    splashColor: _$YgTonalIconButtonTheme.splashColor[1],
  );

  static final YgTonalIconButtonTheme professionalLight = YgTonalIconButtonTheme(
    backgroundColor: _$YgTonalIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor: _$YgTonalIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$YgTonalIconButtonTheme.disabledIconColor[2],
    iconColor: _$YgTonalIconButtonTheme.iconColor[2],
    splashColor: _$YgTonalIconButtonTheme.splashColor[2],
  );

  static final YgTonalIconButtonTheme professionalDark = YgTonalIconButtonTheme(
    backgroundColor: _$YgTonalIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor: _$YgTonalIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$YgTonalIconButtonTheme.disabledIconColor[3],
    iconColor: _$YgTonalIconButtonTheme.iconColor[3],
    splashColor: _$YgTonalIconButtonTheme.splashColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgTonalIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
    Color? splashColor,
  }) {
    return YgTonalIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  YgTonalIconButtonTheme lerp(covariant ThemeExtension<YgTonalIconButtonTheme>? other, double t) {
    if (other is! YgTonalIconButtonTheme) return this as YgTonalIconButtonTheme;
    return YgTonalIconButtonTheme(
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
            other is YgTonalIconButtonTheme &&
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
