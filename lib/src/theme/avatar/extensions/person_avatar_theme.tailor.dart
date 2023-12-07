// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'person_avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPersonAvatarTheme extends ThemeExtension<YgPersonAvatarTheme> {
  const YgPersonAvatarTheme({
    required this.badgeBorder,
    required this.badgeColor,
    required this.badgePadding,
    required this.borderRadius,
  });

  final Border badgeBorder;
  final Color badgeColor;
  final EdgeInsets badgePadding;
  final BorderRadius borderRadius;

  static final YgPersonAvatarTheme consumerLight = YgPersonAvatarTheme(
    badgeBorder: _$YgPersonAvatarTheme.badgeBorder[0],
    badgeColor: _$YgPersonAvatarTheme.badgeColor[0],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[0],
    borderRadius: _$YgPersonAvatarTheme.borderRadius[0],
  );

  static final YgPersonAvatarTheme consumerDark = YgPersonAvatarTheme(
    badgeBorder: _$YgPersonAvatarTheme.badgeBorder[1],
    badgeColor: _$YgPersonAvatarTheme.badgeColor[1],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[1],
    borderRadius: _$YgPersonAvatarTheme.borderRadius[1],
  );

  static final YgPersonAvatarTheme professionalLight = YgPersonAvatarTheme(
    badgeBorder: _$YgPersonAvatarTheme.badgeBorder[2],
    badgeColor: _$YgPersonAvatarTheme.badgeColor[2],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[2],
    borderRadius: _$YgPersonAvatarTheme.borderRadius[2],
  );

  static final YgPersonAvatarTheme professionalDark = YgPersonAvatarTheme(
    badgeBorder: _$YgPersonAvatarTheme.badgeBorder[3],
    badgeColor: _$YgPersonAvatarTheme.badgeColor[3],
    badgePadding: _$YgPersonAvatarTheme.badgePadding[3],
    borderRadius: _$YgPersonAvatarTheme.borderRadius[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgPersonAvatarTheme copyWith({
    Border? badgeBorder,
    Color? badgeColor,
    EdgeInsets? badgePadding,
    BorderRadius? borderRadius,
  }) {
    return YgPersonAvatarTheme(
      badgeBorder: badgeBorder ?? this.badgeBorder,
      badgeColor: badgeColor ?? this.badgeColor,
      badgePadding: badgePadding ?? this.badgePadding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  YgPersonAvatarTheme lerp(
      covariant ThemeExtension<YgPersonAvatarTheme>? other, double t) {
    if (other is! YgPersonAvatarTheme) return this as YgPersonAvatarTheme;
    return YgPersonAvatarTheme(
      badgeBorder: t < 0.5 ? badgeBorder : other.badgeBorder,
      badgeColor: Color.lerp(badgeColor, other.badgeColor, t)!,
      badgePadding: t < 0.5 ? badgePadding : other.badgePadding,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPersonAvatarTheme &&
            const DeepCollectionEquality()
                .equals(badgeBorder, other.badgeBorder) &&
            const DeepCollectionEquality()
                .equals(badgeColor, other.badgeColor) &&
            const DeepCollectionEquality()
                .equals(badgePadding, other.badgePadding) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(badgeBorder),
      const DeepCollectionEquality().hash(badgeColor),
      const DeepCollectionEquality().hash(badgePadding),
      const DeepCollectionEquality().hash(borderRadius),
    );
  }
}
