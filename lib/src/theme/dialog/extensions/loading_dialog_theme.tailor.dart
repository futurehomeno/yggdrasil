// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'loading_dialog_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class LoadingDialogTheme extends ThemeExtension<LoadingDialogTheme> {
  const LoadingDialogTheme({
    required this.iconBackground,
    required this.iconColor,
    required this.iconPadding,
  });

  final Color iconBackground;
  final Color iconColor;
  final EdgeInsets iconPadding;

  static final LoadingDialogTheme consumerLight = LoadingDialogTheme(
    iconBackground: _$LoadingDialogTheme.iconBackground[0],
    iconColor: _$LoadingDialogTheme.iconColor[0],
    iconPadding: _$LoadingDialogTheme.iconPadding[0],
  );

  static final LoadingDialogTheme consumerDark = LoadingDialogTheme(
    iconBackground: _$LoadingDialogTheme.iconBackground[1],
    iconColor: _$LoadingDialogTheme.iconColor[1],
    iconPadding: _$LoadingDialogTheme.iconPadding[1],
  );

  static final LoadingDialogTheme professionalLight = LoadingDialogTheme(
    iconBackground: _$LoadingDialogTheme.iconBackground[2],
    iconColor: _$LoadingDialogTheme.iconColor[2],
    iconPadding: _$LoadingDialogTheme.iconPadding[2],
  );

  static final LoadingDialogTheme professionalDark = LoadingDialogTheme(
    iconBackground: _$LoadingDialogTheme.iconBackground[3],
    iconColor: _$LoadingDialogTheme.iconColor[3],
    iconPadding: _$LoadingDialogTheme.iconPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  LoadingDialogTheme copyWith({
    Color? iconBackground,
    Color? iconColor,
    EdgeInsets? iconPadding,
  }) {
    return LoadingDialogTheme(
      iconBackground: iconBackground ?? this.iconBackground,
      iconColor: iconColor ?? this.iconColor,
      iconPadding: iconPadding ?? this.iconPadding,
    );
  }

  @override
  LoadingDialogTheme lerp(
      covariant ThemeExtension<LoadingDialogTheme>? other, double t) {
    if (other is! LoadingDialogTheme) return this as LoadingDialogTheme;
    return LoadingDialogTheme(
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      iconPadding: t < 0.5 ? iconPadding : other.iconPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingDialogTheme &&
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
