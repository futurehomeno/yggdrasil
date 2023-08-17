// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'filled_card_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class FilledCardTheme extends ThemeExtension<FilledCardTheme> {
  const FilledCardTheme({
    required this.backgroundColor,
  });

  final Color backgroundColor;

  static final FilledCardTheme consumerLight = FilledCardTheme(
    backgroundColor: _$FilledCardTheme.backgroundColor[0],
  );

  static final FilledCardTheme consumerDark = FilledCardTheme(
    backgroundColor: _$FilledCardTheme.backgroundColor[1],
  );

  static final FilledCardTheme professionalLight = FilledCardTheme(
    backgroundColor: _$FilledCardTheme.backgroundColor[2],
  );

  static final FilledCardTheme professionalDark = FilledCardTheme(
    backgroundColor: _$FilledCardTheme.backgroundColor[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  FilledCardTheme copyWith({
    Color? backgroundColor,
  }) {
    return FilledCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  FilledCardTheme lerp(covariant ThemeExtension<FilledCardTheme>? other, double t) {
    if (other is! FilledCardTheme) return this as FilledCardTheme;
    return FilledCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilledCardTheme &&
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
