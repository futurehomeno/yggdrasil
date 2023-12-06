// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'person_avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPersonAvatarTheme extends ThemeExtension<YgPersonAvatarTheme> {
  const YgPersonAvatarTheme({
    required this.badgeColor,
    required this.badgePadding,
  });

  final Color badgeColor;
  final EdgeInsets badgePadding;

  static final YgPersonAvatarTheme consumerLight = YgPersonAvatarTheme(
    badgeColor: _$YgPersonAvatarTheme.badgeColor[0],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[0],
  );

  static final YgPersonAvatarTheme consumerDark = YgPersonAvatarTheme(
    badgeColor: _$YgPersonAvatarTheme.badgeColor[1],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[1],
  );

  static final YgPersonAvatarTheme professionalLight = YgPersonAvatarTheme(
    badgeColor: _$YgPersonAvatarTheme.badgeColor[2],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[2],
  );

  static final YgPersonAvatarTheme professionalDark = YgPersonAvatarTheme(
    badgeColor: _$YgPersonAvatarTheme.badgeColor[3],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPersonAvatarTheme copyWith({
    Color? badgeColor,
    EdgeInsets? badgePadding,
  }) {
    return YgPersonAvatarTheme(
      badgeColor: badgeColor ?? this.badgeColor,
      badgePadding: badgePadding ?? this.badgePadding,
    );
  }

  @override
  YgPersonAvatarTheme lerp(
      covariant ThemeExtension<YgPersonAvatarTheme>? other, double t) {
    if (other is! YgPersonAvatarTheme) return this as YgPersonAvatarTheme;
    return YgPersonAvatarTheme(
      badgeColor: Color.lerp(badgeColor, other.badgeColor, t)!,
      badgePadding: t < 0.5 ? badgePadding : other.badgePadding,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPersonAvatarTheme &&
            const DeepCollectionEquality()
                .equals(badgeColor, other.badgeColor) &&
            const DeepCollectionEquality()
                .equals(badgePadding, other.badgePadding));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgeColor),
      const DeepCollectionEquality().hash(badgePadding),
    );
  }
}
