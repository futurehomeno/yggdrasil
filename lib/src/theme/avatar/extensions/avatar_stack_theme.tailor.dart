// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'avatar_stack_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgAvatarStackTheme extends ThemeExtension<YgAvatarStackTheme> {
  const YgAvatarStackTheme({
    required this.negativeOffset,
  });

  final double negativeOffset;

  static final YgAvatarStackTheme consumerLight = YgAvatarStackTheme(
    negativeOffset: _$YgAvatarStackTheme.negativeOffset[0],
  );

  static final YgAvatarStackTheme consumerDark = YgAvatarStackTheme(
    negativeOffset: _$YgAvatarStackTheme.negativeOffset[1],
  );

  static final YgAvatarStackTheme professionalLight = YgAvatarStackTheme(
    negativeOffset: _$YgAvatarStackTheme.negativeOffset[2],
  );

  static final YgAvatarStackTheme professionalDark = YgAvatarStackTheme(
    negativeOffset: _$YgAvatarStackTheme.negativeOffset[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgAvatarStackTheme copyWith({
    double? negativeOffset,
  }) {
    return YgAvatarStackTheme(
      negativeOffset: negativeOffset ?? this.negativeOffset,
    );
  }

  @override
  YgAvatarStackTheme lerp(
      covariant ThemeExtension<YgAvatarStackTheme>? other, double t) {
    if (other is! YgAvatarStackTheme) return this as YgAvatarStackTheme;
    return YgAvatarStackTheme(
      negativeOffset: t < 0.5 ? negativeOffset : other.negativeOffset,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgAvatarStackTheme &&
            const DeepCollectionEquality()
                .equals(negativeOffset, other.negativeOffset));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(negativeOffset),
    );
  }
}
