// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'success_dialog_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class SuccessDialogTheme extends ThemeExtension<SuccessDialogTheme> {
  const SuccessDialogTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;

  static final SuccessDialogTheme consumerLight = SuccessDialogTheme(
    iconBackground: _$SuccessDialogTheme.iconBackground[0],
    iconColor: _$SuccessDialogTheme.iconColor[0],
    iconPadding: _$SuccessDialogTheme.iconPadding[0],
  );

  static final SuccessDialogTheme consumerDark = SuccessDialogTheme(
    iconBackground: _$SuccessDialogTheme.iconBackground[1],
    iconColor: _$SuccessDialogTheme.iconColor[1],
    iconPadding: _$SuccessDialogTheme.iconPadding[1],
  );

  static final SuccessDialogTheme professionalLight = SuccessDialogTheme(
    iconBackground: _$SuccessDialogTheme.iconBackground[2],
    iconColor: _$SuccessDialogTheme.iconColor[2],
    iconPadding: _$SuccessDialogTheme.iconPadding[2],
  );

  static final SuccessDialogTheme professionalDark = SuccessDialogTheme(
    iconBackground: _$SuccessDialogTheme.iconBackground[3],
    iconColor: _$SuccessDialogTheme.iconColor[3],
    iconPadding: _$SuccessDialogTheme.iconPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  SuccessDialogTheme copyWith({
    Color? iconBackground,
    Color? iconColor,
    EdgeInsets? iconPadding,
  }) {
    return SuccessDialogTheme(
      iconBackground: iconBackground ?? this.iconBackground,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
    );
  }

  @override
  SuccessDialogTheme lerp(
      covariant ThemeExtension<SuccessDialogTheme>? other, double t) {
    if (other is! SuccessDialogTheme) return this as SuccessDialogTheme;
    return SuccessDialogTheme(
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessDialogTheme &&
            const DeepCollectionEquality()
                .equals(iconBackground, other.iconBackground) &&
            const DeepCollectionEquality().equals(iconColor, other.iconColor) &&
            const DeepCollectionEquality()
                .equals(iconPadding, other.iconPadding));
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
