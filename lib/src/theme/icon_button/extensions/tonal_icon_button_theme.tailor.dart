// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tonal_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class TonalIconButtonTheme extends ThemeExtension<TonalIconButtonTheme> {
  const TonalIconButtonTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;

  static final TonalIconButtonTheme consumerLight = TonalIconButtonTheme(
    backgroundColor: _$TonalIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor: _$TonalIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$TonalIconButtonTheme.disabledIconColor[0],
    iconColor: _$TonalIconButtonTheme.iconColor[0],
  );

  static final TonalIconButtonTheme consumerDark = TonalIconButtonTheme(
    backgroundColor: _$TonalIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor: _$TonalIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$TonalIconButtonTheme.disabledIconColor[1],
    iconColor: _$TonalIconButtonTheme.iconColor[1],
  );

  static final TonalIconButtonTheme professionalLight = TonalIconButtonTheme(
    backgroundColor: _$TonalIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor: _$TonalIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$TonalIconButtonTheme.disabledIconColor[2],
    iconColor: _$TonalIconButtonTheme.iconColor[2],
  );

  static final TonalIconButtonTheme professionalDark = TonalIconButtonTheme(
    backgroundColor: _$TonalIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor: _$TonalIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$TonalIconButtonTheme.disabledIconColor[3],
    iconColor: _$TonalIconButtonTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  TonalIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
  }) {
    return TonalIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  TonalIconButtonTheme lerp(
      covariant ThemeExtension<TonalIconButtonTheme>? other, double t) {
    if (other is! TonalIconButtonTheme) return this as TonalIconButtonTheme;
    return TonalIconButtonTheme(
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
            other is TonalIconButtonTheme &&
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
