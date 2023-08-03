// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'filled_icon_button_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class FilledIconButtonTheme extends ThemeExtension<FilledIconButtonTheme> {
  const FilledIconButtonTheme({
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.disabledIconColor,
    required this.iconColor,
  });

  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color disabledIconColor;
  final Color iconColor;

  static final FilledIconButtonTheme consumerLight = FilledIconButtonTheme(
    backgroundColor: _$FilledIconButtonTheme.backgroundColor[0],
    disabledBackgroundColor: _$FilledIconButtonTheme.disabledBackgroundColor[0],
    disabledIconColor: _$FilledIconButtonTheme.disabledIconColor[0],
    iconColor: _$FilledIconButtonTheme.iconColor[0],
  );

  static final FilledIconButtonTheme consumerDark = FilledIconButtonTheme(
    backgroundColor: _$FilledIconButtonTheme.backgroundColor[1],
    disabledBackgroundColor: _$FilledIconButtonTheme.disabledBackgroundColor[1],
    disabledIconColor: _$FilledIconButtonTheme.disabledIconColor[1],
    iconColor: _$FilledIconButtonTheme.iconColor[1],
  );

  static final FilledIconButtonTheme professionalLight = FilledIconButtonTheme(
    backgroundColor: _$FilledIconButtonTheme.backgroundColor[2],
    disabledBackgroundColor: _$FilledIconButtonTheme.disabledBackgroundColor[2],
    disabledIconColor: _$FilledIconButtonTheme.disabledIconColor[2],
    iconColor: _$FilledIconButtonTheme.iconColor[2],
  );

  static final FilledIconButtonTheme professionalDark = FilledIconButtonTheme(
    backgroundColor: _$FilledIconButtonTheme.backgroundColor[3],
    disabledBackgroundColor: _$FilledIconButtonTheme.disabledBackgroundColor[3],
    disabledIconColor: _$FilledIconButtonTheme.disabledIconColor[3],
    iconColor: _$FilledIconButtonTheme.iconColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  FilledIconButtonTheme copyWith({
    Color? backgroundColor,
    Color? disabledBackgroundColor,
    Color? disabledIconColor,
    Color? iconColor,
  }) {
    return FilledIconButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  FilledIconButtonTheme lerp(
      covariant ThemeExtension<FilledIconButtonTheme>? other, double t) {
    if (other is! FilledIconButtonTheme) return this as FilledIconButtonTheme;
    return FilledIconButtonTheme(
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
            other is FilledIconButtonTheme &&
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
