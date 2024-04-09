// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'company_avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCompanyAvatarTheme extends ThemeExtension<YgCompanyAvatarTheme> {
  const YgCompanyAvatarTheme({
    required this.borderRadius,
  });

  final BorderRadius borderRadius;

  static final YgCompanyAvatarTheme consumerLight = YgCompanyAvatarTheme(
    borderRadius: _$YgCompanyAvatarTheme.borderRadius[0],
  );

  static final YgCompanyAvatarTheme consumerDark = YgCompanyAvatarTheme(
    borderRadius: _$YgCompanyAvatarTheme.borderRadius[1],
  );

  static final YgCompanyAvatarTheme professionalLight = YgCompanyAvatarTheme(
    borderRadius: _$YgCompanyAvatarTheme.borderRadius[2],
  );

  static final YgCompanyAvatarTheme professionalDark = YgCompanyAvatarTheme(
    borderRadius: _$YgCompanyAvatarTheme.borderRadius[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCompanyAvatarTheme copyWith({
    BorderRadius? borderRadius,
  }) {
    return YgCompanyAvatarTheme(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  YgCompanyAvatarTheme lerp(
      covariant ThemeExtension<YgCompanyAvatarTheme>? other, double t) {
    if (other is! YgCompanyAvatarTheme) return this as YgCompanyAvatarTheme;
    return YgCompanyAvatarTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCompanyAvatarTheme &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(borderRadius),
    );
  }
}
