// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'confirm_dialog_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ConfirmDialogTheme extends ThemeExtension<ConfirmDialogTheme> {
  const ConfirmDialogTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;

  static final ConfirmDialogTheme consumerLight = ConfirmDialogTheme(
    iconBackground: _$ConfirmDialogTheme.iconBackground[0],
    iconColor: _$ConfirmDialogTheme.iconColor[0],
    iconPadding: _$ConfirmDialogTheme.iconPadding[0],
  );

  static final ConfirmDialogTheme consumerDark = ConfirmDialogTheme(
    iconBackground: _$ConfirmDialogTheme.iconBackground[1],
    iconColor: _$ConfirmDialogTheme.iconColor[1],
    iconPadding: _$ConfirmDialogTheme.iconPadding[1],
  );

  static final ConfirmDialogTheme professionalLight = ConfirmDialogTheme(
    iconBackground: _$ConfirmDialogTheme.iconBackground[2],
    iconColor: _$ConfirmDialogTheme.iconColor[2],
    iconPadding: _$ConfirmDialogTheme.iconPadding[2],
  );

  static final ConfirmDialogTheme professionalDark = ConfirmDialogTheme(
    iconBackground: _$ConfirmDialogTheme.iconBackground[3],
    iconColor: _$ConfirmDialogTheme.iconColor[3],
    iconPadding: _$ConfirmDialogTheme.iconPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ConfirmDialogTheme copyWith({
    Color? iconBackground,
    Color? iconColor,
    EdgeInsets? iconPadding,
  }) {
    return ConfirmDialogTheme(
      iconBackground: iconBackground ?? this.iconBackground,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
    );
  }

  @override
  ConfirmDialogTheme lerp(covariant ThemeExtension<ConfirmDialogTheme>? other, double t) {
    if (other is! ConfirmDialogTheme) return this as ConfirmDialogTheme;
    return ConfirmDialogTheme(
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmDialogTheme &&
            const DeepCollectionEquality().equals(iconBackground, other.iconBackground) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality().equals(iconPadding, other.iconPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(iconBackground),
      const DeepCollectionEquality().hash(iconColor),
      const DeepCollectionEquality().hash(iconPadding),
    );
  }
}
