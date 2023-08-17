// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'standard_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class StandardIconButtonTheme extends ThemeExtension<StandardIconButtonTheme> {
  const StandardIconButtonTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;

  static final StandardIconButtonTheme consumerLight = StandardIconButtonTheme(
    backgroundColor: _$StandardIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor:
        _$StandardIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$StandardIconButtonTheme.disabledIconColor[0],
    iconColor: _$StandardIconButtonTheme.iconColor[0],
  );

  static final StandardIconButtonTheme consumerDark = StandardIconButtonTheme(
    backgroundColor: _$StandardIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor:
        _$StandardIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$StandardIconButtonTheme.disabledIconColor[1],
    iconColor: _$StandardIconButtonTheme.iconColor[1],
  );

  static final StandardIconButtonTheme professionalLight =
      StandardIconButtonTheme(
    backgroundColor: _$StandardIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor:
        _$StandardIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$StandardIconButtonTheme.disabledIconColor[2],
    iconColor: _$StandardIconButtonTheme.iconColor[2],
  );

  static final StandardIconButtonTheme professionalDark =
      StandardIconButtonTheme(
    backgroundColor: _$StandardIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor:
        _$StandardIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$StandardIconButtonTheme.disabledIconColor[3],
    iconColor: _$StandardIconButtonTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  StandardIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
  }) {
    return StandardIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  StandardIconButtonTheme lerp(
      covariant ThemeExtension<StandardIconButtonTheme>? other, double t) {
    if (other is! StandardIconButtonTheme)
      return this as StandardIconButtonTheme;
    return StandardIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      disabledBackgroundColor: Color.lerp(
          disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledIconColor:
          Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StandardIconButtonTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(
                disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality()
                .equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(disabledBackgroundColor),
      const DeepCollectionEquality().hash(disabledIconColor),
      const DeepCollectionEquality().hash(iconColor),
    );
  }
}
