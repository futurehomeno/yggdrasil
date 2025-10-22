// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'elevated_card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class ElevatedCardTheme extends ThemeExtension<ElevatedCardTheme> {
  const ElevatedCardTheme({
    required this.backgroundColor,
  });

  final Color backgroundColor;

  static final ElevatedCardTheme consumerLight = ElevatedCardTheme(
    backgroundColor: _$ElevatedCardTheme.backgroundColor[0],
  );

  static final ElevatedCardTheme consumerDark = ElevatedCardTheme(
    backgroundColor: _$ElevatedCardTheme.backgroundColor[1],
  );

  static final ElevatedCardTheme professionalLight = ElevatedCardTheme(
    backgroundColor: _$ElevatedCardTheme.backgroundColor[2],
  );

  static final ElevatedCardTheme professionalDark = ElevatedCardTheme(
    backgroundColor: _$ElevatedCardTheme.backgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  ElevatedCardTheme copyWith({
    Color? backgroundColor,
  }) {
    return ElevatedCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ElevatedCardTheme lerp(covariant ThemeExtension<ElevatedCardTheme>? other, double t) {
    if (other is! ElevatedCardTheme) return this as ElevatedCardTheme;
    return ElevatedCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElevatedCardTheme &&
            const DeepCollectionEquality().equals(backgroundColor, other.backgroundColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}
