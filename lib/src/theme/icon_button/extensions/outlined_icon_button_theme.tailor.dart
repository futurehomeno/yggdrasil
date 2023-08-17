// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'outlined_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class OutlinedIconButtonTheme extends ThemeExtension<OutlinedIconButtonTheme> {
  const OutlinedIconButtonTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.disabledBackgroundColor,
    required this.disabledBorderColor,
    required this.disabledIconColor,
    required this.iconColor,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color disabledBackgroundColor;
  final Color disabledBorderColor;
  final Color disabledIconColor;
  final Color iconColor;

  static final OutlinedIconButtonTheme consumerLight = OutlinedIconButtonTheme(
    backgroundColor: _$OutlinedIconButtonTheme.backgroundColor[0],
    borderColor: _$OutlinedIconButtonTheme.borderColor[0],
    disabledBackgroundColor: _$OutlinedIconButtonTheme.disabledBackgroundColor[0],
    disabledBorderColor: _$OutlinedIconButtonTheme.disabledBorderColor[0],
    disabledIconColor: _$OutlinedIconButtonTheme.disabledIconColor[0],
    iconColor: _$OutlinedIconButtonTheme.iconColor[0],
  );

  static final OutlinedIconButtonTheme consumerDark = OutlinedIconButtonTheme(
    backgroundColor: _$OutlinedIconButtonTheme.backgroundColor[1],
    borderColor: _$OutlinedIconButtonTheme.borderColor[1],
    disabledBackgroundColor: _$OutlinedIconButtonTheme.disabledBackgroundColor[1],
    disabledBorderColor: _$OutlinedIconButtonTheme.disabledBorderColor[1],
    disabledIconColor: _$OutlinedIconButtonTheme.disabledIconColor[1],
    iconColor: _$OutlinedIconButtonTheme.iconColor[1],
  );

  static final OutlinedIconButtonTheme professionalLight = OutlinedIconButtonTheme(
    backgroundColor: _$OutlinedIconButtonTheme.backgroundColor[2],
    borderColor: _$OutlinedIconButtonTheme.borderColor[2],
    disabledBackgroundColor: _$OutlinedIconButtonTheme.disabledBackgroundColor[2],
    disabledBorderColor: _$OutlinedIconButtonTheme.disabledBorderColor[2],
    disabledIconColor: _$OutlinedIconButtonTheme.disabledIconColor[2],
    iconColor: _$OutlinedIconButtonTheme.iconColor[2],
  );

  static final OutlinedIconButtonTheme professionalDark = OutlinedIconButtonTheme(
    backgroundColor: _$OutlinedIconButtonTheme.backgroundColor[3],
    borderColor: _$OutlinedIconButtonTheme.borderColor[3],
    disabledBackgroundColor: _$OutlinedIconButtonTheme.disabledBackgroundColor[3],
    disabledBorderColor: _$OutlinedIconButtonTheme.disabledBorderColor[3],
    disabledIconColor: _$OutlinedIconButtonTheme.disabledIconColor[3],
    iconColor: _$OutlinedIconButtonTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  OutlinedIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? disabledBackgroundColor,
    Color? disabledBorderColor,
    Color? disabledIconColor,
    Color? iconColor,
  }) {
    return OutlinedIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  OutlinedIconButtonTheme lerp(covariant ThemeExtension<OutlinedIconButtonTheme>? other, double t) {
    if (other is! OutlinedIconButtonTheme) return this as OutlinedIconButtonTheme;
    return OutlinedIconButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      disabledBackgroundColor: Color.lerp(disabledBackgroundColor, other.disabledBackgroundColor, t)!,
      disabledBorderColor: Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      disabledIconColor: Color.lerp(disabledIconColor, other.disabledIconColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutlinedIconButtonTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderColor, other.borderColor) &&
            const DeepCollectionEquality().equals(disabledBackgroundColor, other.disabledBackgroundColor) &&
            const DeepCollectionEquality().equals(disabledBorderColor, other.disabledBorderColor) &&
            const DeepCollectionEquality().equals(disabledIconColor, other.disabledIconColor) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor));
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
    );
  }
}
