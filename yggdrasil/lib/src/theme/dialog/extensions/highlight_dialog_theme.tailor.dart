// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'highlight_dialog_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class HighlightDialogTheme extends ThemeExtension<HighlightDialogTheme> {
  const HighlightDialogTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;

  static final HighlightDialogTheme consumerLight = HighlightDialogTheme(
    iconBackground: _$HighlightDialogTheme.iconBackground[0],
    iconColor: _$HighlightDialogTheme.iconColor[0],
    iconPadding: _$HighlightDialogTheme.iconPadding[0],
  );

  static final HighlightDialogTheme consumerDark = HighlightDialogTheme(
    iconBackground: _$HighlightDialogTheme.iconBackground[1],
    iconColor: _$HighlightDialogTheme.iconColor[1],
    iconPadding: _$HighlightDialogTheme.iconPadding[1],
  );

  static final HighlightDialogTheme professionalLight = HighlightDialogTheme(
    iconBackground: _$HighlightDialogTheme.iconBackground[2],
    iconColor: _$HighlightDialogTheme.iconColor[2],
    iconPadding: _$HighlightDialogTheme.iconPadding[2],
  );

  static final HighlightDialogTheme professionalDark = HighlightDialogTheme(
    iconBackground: _$HighlightDialogTheme.iconBackground[3],
    iconColor: _$HighlightDialogTheme.iconColor[3],
    iconPadding: _$HighlightDialogTheme.iconPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  HighlightDialogTheme copyWith({
    Color? iconBackground,
    Color? iconColor,
    EdgeInsets? iconPadding,
  }) {
    return HighlightDialogTheme(
      iconBackground: iconBackground ?? this.iconBackground,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
    );
  }

  @override
  HighlightDialogTheme lerp(
      covariant ThemeExtension<HighlightDialogTheme>? other, double t) {
    if (other is! HighlightDialogTheme) return this as HighlightDialogTheme;
    return HighlightDialogTheme(
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightDialogTheme &&
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
