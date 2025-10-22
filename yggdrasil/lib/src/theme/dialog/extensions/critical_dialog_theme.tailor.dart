// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'critical_dialog_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class CriticalDialogTheme extends ThemeExtension<CriticalDialogTheme> {
  const CriticalDialogTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;

  static final CriticalDialogTheme consumerLight = CriticalDialogTheme(
    iconBackground: _$CriticalDialogTheme.iconBackground[0],
    iconColor: _$CriticalDialogTheme.iconColor[0],
    iconPadding: _$CriticalDialogTheme.iconPadding[0],
  );

  static final CriticalDialogTheme consumerDark = CriticalDialogTheme(
    iconBackground: _$CriticalDialogTheme.iconBackground[1],
    iconColor: _$CriticalDialogTheme.iconColor[1],
    iconPadding: _$CriticalDialogTheme.iconPadding[1],
  );

  static final CriticalDialogTheme professionalLight = CriticalDialogTheme(
    iconBackground: _$CriticalDialogTheme.iconBackground[2],
    iconColor: _$CriticalDialogTheme.iconColor[2],
    iconPadding: _$CriticalDialogTheme.iconPadding[2],
  );

  static final CriticalDialogTheme professionalDark = CriticalDialogTheme(
    iconBackground: _$CriticalDialogTheme.iconBackground[3],
    iconColor: _$CriticalDialogTheme.iconColor[3],
    iconPadding: _$CriticalDialogTheme.iconPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  CriticalDialogTheme copyWith({
    Color? iconBackground,
    Color? iconColor,
    EdgeInsets? iconPadding,
  }) {
    return CriticalDialogTheme(
      iconBackground: iconBackground ?? this.iconBackground,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
    );
  }

  @override
  CriticalDialogTheme lerp(covariant ThemeExtension<CriticalDialogTheme>? other, double t) {
    if (other is! CriticalDialogTheme) return this as CriticalDialogTheme;
    return CriticalDialogTheme(
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CriticalDialogTheme &&
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
