// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'outlined_card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class OutlinedCardTheme extends ThemeExtension<OutlinedCardTheme> {
  const OutlinedCardTheme({
    required this.backgroundColor,
    required this.borderSide,
  });

  final Color backgroundColor;
  final BorderSide borderSide;

  static final OutlinedCardTheme consumerLight = OutlinedCardTheme(
    backgroundColor: _$OutlinedCardTheme.backgroundColor[0],
    borderSide: _$OutlinedCardTheme.borderSide[0],
  );

  static final OutlinedCardTheme consumerDark = OutlinedCardTheme(
    backgroundColor: _$OutlinedCardTheme.backgroundColor[1],
    borderSide: _$OutlinedCardTheme.borderSide[1],
  );

  static final OutlinedCardTheme professionalLight = OutlinedCardTheme(
    backgroundColor: _$OutlinedCardTheme.backgroundColor[2],
    borderSide: _$OutlinedCardTheme.borderSide[2],
  );

  static final OutlinedCardTheme professionalDark = OutlinedCardTheme(
    backgroundColor: _$OutlinedCardTheme.backgroundColor[3],
    borderSide: _$OutlinedCardTheme.borderSide[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  OutlinedCardTheme copyWith({
    Color? backgroundColor,
    BorderSide? borderSide,
  }) {
    return OutlinedCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderSide: borderSide ?? this.borderSide,
    );
  }

  @override
  OutlinedCardTheme lerp(covariant ThemeExtension<OutlinedCardTheme>? other, double t) {
    if (other is! OutlinedCardTheme) return this as OutlinedCardTheme;
    return OutlinedCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderSide: t < 0.5 ? borderSide : other.borderSide,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OutlinedCardTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor) &&
            const DeepCollectionEquality().equals(borderSide, other.borderSide));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(borderSide),
    );
  }
}
