// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'person_avatar_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgPersonAvatarTheme extends ThemeExtension<YgPersonAvatarTheme> {
  const YgPersonAvatarTheme({
    required this.borderRadius,
  });

  final BorderRadius borderRadius;

  static final YgPersonAvatarTheme consumerLight = YgPersonAvatarTheme(
    borderRadius: _$YgPersonAvatarTheme.borderRadius[0],
  );

  static final YgPersonAvatarTheme consumerDark = YgPersonAvatarTheme(
    borderRadius: _$YgPersonAvatarTheme.borderRadius[1],
  );

  static final YgPersonAvatarTheme professionalLight = YgPersonAvatarTheme(
    borderRadius: _$YgPersonAvatarTheme.borderRadius[2],
  );

  static final YgPersonAvatarTheme professionalDark = YgPersonAvatarTheme(
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
    BorderRadius? borderRadius,
  }) {
    return YgPersonAvatarTheme(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  YgPersonAvatarTheme lerp(
      covariant ThemeExtension<YgPersonAvatarTheme>? other, double t) {
    if (other is! YgPersonAvatarTheme) return this as YgPersonAvatarTheme;
    return YgPersonAvatarTheme(
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgPersonAvatarTheme &&
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
