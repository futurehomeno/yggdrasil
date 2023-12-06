// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'company_avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgCompanyAvatarTheme extends ThemeExtension<YgCompanyAvatarTheme> {
  const YgCompanyAvatarTheme({
    required this.badgePadding,
  });

  final BorderRadius badgePadding;

  static final YgCompanyAvatarTheme consumerLight = YgCompanyAvatarTheme(
    badgePadding: _$YgCompanyAvatarTheme.badgePadding[0],
  );

  static final YgCompanyAvatarTheme consumerDark = YgCompanyAvatarTheme(
    badgePadding: _$YgCompanyAvatarTheme.badgePadding[1],
  );

  static final YgCompanyAvatarTheme professionalLight = YgCompanyAvatarTheme(
    badgePadding: _$YgCompanyAvatarTheme.badgePadding[2],
  );

  static final YgCompanyAvatarTheme professionalDark = YgCompanyAvatarTheme(
    badgePadding: _$YgCompanyAvatarTheme.badgePadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgCompanyAvatarTheme copyWith({
    BorderRadius? badgePadding,
  }) {
    return YgCompanyAvatarTheme(
      badgePadding: badgePadding ?? this.badgePadding,
    );
  }

  @override
  YgCompanyAvatarTheme lerp(
      covariant ThemeExtension<YgCompanyAvatarTheme>? other, double t) {
    if (other is! YgCompanyAvatarTheme) return this as YgCompanyAvatarTheme;
    return YgCompanyAvatarTheme(
      badgePadding: t < 0.5 ? badgePadding : other.badgePadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgCompanyAvatarTheme &&
            const DeepCollectionEquality()
                .equals(badgePadding, other.badgePadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgePadding),
    );
  }
}
