// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class MyTheme extends ThemeExtension<MyTheme> {
  const MyTheme({
    required this.buttonThemes,
  });

  final YgButtonThemes buttonThemes;

  static final MyTheme consumerLight = MyTheme(
    buttonThemes: _$MyTheme.buttonThemes[0],
  );

  static final MyTheme consumerDark = MyTheme(
    buttonThemes: _$MyTheme.buttonThemes[1],
  );

  static final MyTheme professionalLight = MyTheme(
    buttonThemes: _$MyTheme.buttonThemes[2],
  );

  static final MyTheme professionalDark = MyTheme(
    buttonThemes: _$MyTheme.buttonThemes[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  MyTheme copyWith({
    YgButtonThemes? buttonThemes,
  }) {
    return MyTheme(
      buttonThemes: buttonThemes ?? this.buttonThemes,
    );
  }

  @override
  MyTheme lerp(ThemeExtension<MyTheme>? other, double t) {
    if (other is! MyTheme) return this;
    return MyTheme(
      buttonThemes: buttonThemes.lerp(other.buttonThemes, t),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyTheme &&
            const DeepCollectionEquality()
                .equals(buttonThemes, other.buttonThemes));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(buttonThemes));
  }
}

extension MyThemeBuildContextProps on BuildContext {
  MyTheme get _myTheme => Theme.of(this).extension<MyTheme>()!;
  YgButtonThemes get buttonThemes => _myTheme.buttonThemes;
}
