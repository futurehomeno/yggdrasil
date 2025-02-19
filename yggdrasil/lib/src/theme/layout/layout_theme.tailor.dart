// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'layout_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgLayoutTheme extends ThemeExtension<YgLayoutTheme> {
  const YgLayoutTheme({
    required this.backgroundColor,
    required this.footerPadding,
  });

  final Color backgroundColor;
  final EdgeInsets footerPadding;

  static final YgLayoutTheme consumerLight = YgLayoutTheme(
    backgroundColor: _$YgLayoutTheme.backgroundColor[0],
    footerPadding: _$YgLayoutTheme.footerPadding[0],
  );

  static final YgLayoutTheme consumerDark = YgLayoutTheme(
    backgroundColor: _$YgLayoutTheme.backgroundColor[1],
    footerPadding: _$YgLayoutTheme.footerPadding[1],
  );

  static final YgLayoutTheme professionalLight = YgLayoutTheme(
    backgroundColor: _$YgLayoutTheme.backgroundColor[2],
    footerPadding: _$YgLayoutTheme.footerPadding[2],
  );

  static final YgLayoutTheme professionalDark = YgLayoutTheme(
    backgroundColor: _$YgLayoutTheme.backgroundColor[3],
    footerPadding: _$YgLayoutTheme.footerPadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgLayoutTheme copyWith({
    Color? backgroundColor,
    EdgeInsets? footerPadding,
  }) {
    return YgLayoutTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      footerPadding: footerPadding ?? this.footerPadding,
    );
  }

  @override
  YgLayoutTheme lerp(covariant ThemeExtension<YgLayoutTheme>? other, double t) {
    if (other is! YgLayoutTheme) return this as YgLayoutTheme;
    return YgLayoutTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      footerPadding: t < 0.5 ? footerPadding : other.footerPadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgLayoutTheme &&
            const DeepCollectionEquality()
                .equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality()
                .equals(footerPadding, other.footerPadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(footerPadding),
    );
  }
}
