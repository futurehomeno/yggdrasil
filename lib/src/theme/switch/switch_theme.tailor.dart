// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'switch_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgSwitchTheme extends ThemeExtension<YgSwitchTheme> {
  const YgSwitchTheme({
    required this.backgroundDeselectedColor,
    required this.backgroundDisabledColor,
    required this.backgroundNullColor,
    required this.backgroundSelectedColor,
    required this.borderRadius,
    required this.handleDeselectedColor,
    required this.handleDisabledColor,
    required this.handleNullColor,
    required this.handleSelectedColor,
    required this.handleSize,
    required this.height,
    required this.width,
  });

  final Color backgroundDeselectedColor;
  final Color backgroundDisabledColor;
  final Color backgroundNullColor;
  final Color backgroundSelectedColor;
  final BorderRadius borderRadius;
  final Color handleDeselectedColor;
  final Color handleDisabledColor;
  final Color handleNullColor;
  final Color handleSelectedColor;
  final double handleSize;
  final double height;
  final double width;

  static final YgSwitchTheme consumerLight = YgSwitchTheme(
    backgroundDeselectedColor: _$YgSwitchTheme.backgroundDeselectedColor[0],
    backgroundDisabledColor: _$YgSwitchTheme.backgroundDisabledColor[0],
    backgroundNullColor: _$YgSwitchTheme.backgroundNullColor[0],
    backgroundSelectedColor: _$YgSwitchTheme.backgroundSelectedColor[0],
    borderRadius: _$YgSwitchTheme.borderRadius[0],
    handleDeselectedColor: _$YgSwitchTheme.handleDeselectedColor[0],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[0],
    handleNullColor: _$YgSwitchTheme.handleNullColor[0],
    handleSelectedColor: _$YgSwitchTheme.handleSelectedColor[0],
    handleSize: _$YgSwitchTheme.handleSize[0],
    height: _$YgSwitchTheme.height[0],
    width: _$YgSwitchTheme.width[0],
  );

  static final YgSwitchTheme consumerDark = YgSwitchTheme(
    backgroundDeselectedColor: _$YgSwitchTheme.backgroundDeselectedColor[1],
    backgroundDisabledColor: _$YgSwitchTheme.backgroundDisabledColor[1],
    backgroundNullColor: _$YgSwitchTheme.backgroundNullColor[1],
    backgroundSelectedColor: _$YgSwitchTheme.backgroundSelectedColor[1],
    borderRadius: _$YgSwitchTheme.borderRadius[1],
    handleDeselectedColor: _$YgSwitchTheme.handleDeselectedColor[1],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[1],
    handleNullColor: _$YgSwitchTheme.handleNullColor[1],
    handleSelectedColor: _$YgSwitchTheme.handleSelectedColor[1],
    handleSize: _$YgSwitchTheme.handleSize[1],
    height: _$YgSwitchTheme.height[1],
    width: _$YgSwitchTheme.width[1],
  );

  static final YgSwitchTheme professionalLight = YgSwitchTheme(
    backgroundDeselectedColor: _$YgSwitchTheme.backgroundDeselectedColor[2],
    backgroundDisabledColor: _$YgSwitchTheme.backgroundDisabledColor[2],
    backgroundNullColor: _$YgSwitchTheme.backgroundNullColor[2],
    backgroundSelectedColor: _$YgSwitchTheme.backgroundSelectedColor[2],
    borderRadius: _$YgSwitchTheme.borderRadius[2],
    handleDeselectedColor: _$YgSwitchTheme.handleDeselectedColor[2],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[2],
    handleNullColor: _$YgSwitchTheme.handleNullColor[2],
    handleSelectedColor: _$YgSwitchTheme.handleSelectedColor[2],
    handleSize: _$YgSwitchTheme.handleSize[2],
    height: _$YgSwitchTheme.height[2],
    width: _$YgSwitchTheme.width[2],
  );

  static final YgSwitchTheme professionalDark = YgSwitchTheme(
    backgroundDeselectedColor: _$YgSwitchTheme.backgroundDeselectedColor[3],
    backgroundDisabledColor: _$YgSwitchTheme.backgroundDisabledColor[3],
    backgroundNullColor: _$YgSwitchTheme.backgroundNullColor[3],
    backgroundSelectedColor: _$YgSwitchTheme.backgroundSelectedColor[3],
    borderRadius: _$YgSwitchTheme.borderRadius[3],
    handleDeselectedColor: _$YgSwitchTheme.handleDeselectedColor[3],
    handleDisabledColor: _$YgSwitchTheme.handleDisabledColor[3],
    handleNullColor: _$YgSwitchTheme.handleNullColor[3],
    handleSelectedColor: _$YgSwitchTheme.handleSelectedColor[3],
    handleSize: _$YgSwitchTheme.handleSize[3],
    height: _$YgSwitchTheme.height[3],
    width: _$YgSwitchTheme.width[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgSwitchTheme copyWith({
    Color? backgroundDeselectedColor,
    Color? backgroundDisabledColor,
    Color? backgroundNullColor,
    Color? backgroundSelectedColor,
    BorderRadius? borderRadius,
    Color? handleDeselectedColor,
    Color? handleDisabledColor,
    Color? handleNullColor,
    Color? handleSelectedColor,
    double? handleSize,
    double? height,
    double? width,
  }) {
    return YgSwitchTheme(
      backgroundDeselectedColor:
          backgroundDeselectedColor ?? this.backgroundDeselectedColor,
      backgroundDisabledColor:
          backgroundDisabledColor ?? this.backgroundDisabledColor,
      backgroundNullColor: backgroundNullColor ?? this.backgroundNullColor,
      backgroundSelectedColor:
          backgroundSelectedColor ?? this.backgroundSelectedColor,
      borderRadius: borderRadius ?? this.borderRadius,
      handleDeselectedColor:
          handleDeselectedColor ?? this.handleDeselectedColor,
      handleDisabledColor: handleDisabledColor ?? this.handleDisabledColor,
      handleNullColor: handleNullColor ?? this.handleNullColor,
      handleSelectedColor: handleSelectedColor ?? this.handleSelectedColor,
      handleSize: handleSize ?? this.handleSize,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  @override
  YgSwitchTheme lerp(covariant ThemeExtension<YgSwitchTheme>? other, double t) {
    if (other is! YgSwitchTheme) return this as YgSwitchTheme;
    return YgSwitchTheme(
      backgroundDeselectedColor: Color.lerp(
          backgroundDeselectedColor, other.backgroundDeselectedColor, t)!,
      backgroundDisabledColor: Color.lerp(
          backgroundDisabledColor, other.backgroundDisabledColor, t)!,
      backgroundNullColor:
          Color.lerp(backgroundNullColor, other.backgroundNullColor, t)!,
      backgroundSelectedColor: Color.lerp(
          backgroundSelectedColor, other.backgroundSelectedColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      handleDeselectedColor:
          Color.lerp(handleDeselectedColor, other.handleDeselectedColor, t)!,
      handleDisabledColor:
          Color.lerp(handleDisabledColor, other.handleDisabledColor, t)!,
      handleNullColor: Color.lerp(handleNullColor, other.handleNullColor, t)!,
      handleSelectedColor:
          Color.lerp(handleSelectedColor, other.handleSelectedColor, t)!,
      handleSize: t < 0.5 ? handleSize : other.handleSize,
      height: t < 0.5 ? height : other.height,
      width: t < 0.5 ? width : other.width,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgSwitchTheme &&
            const DeepCollectionEquality().equals(
                backgroundDeselectedColor, other.backgroundDeselectedColor) &&
            const DeepCollectionEquality().equals(
                backgroundDisabledColor, other.backgroundDisabledColor) &&
            const DeepCollectionEquality()
                .equals(backgroundNullColor, other.backgroundNullColor) &&
            const DeepCollectionEquality().equals(
                backgroundSelectedColor, other.backgroundSelectedColor) &&
            const DeepCollectionEquality()
                .equals(borderRadius, other.borderRadius) &&
            const DeepCollectionEquality()
                .equals(handleDeselectedColor, other.handleDeselectedColor) &&
            const DeepCollectionEquality()
                .equals(handleDisabledColor, other.handleDisabledColor) &&
            const DeepCollectionEquality()
                .equals(handleNullColor, other.handleNullColor) &&
            const DeepCollectionEquality()
                .equals(handleSelectedColor, other.handleSelectedColor) &&
            const DeepCollectionEquality()
                .equals(handleSize, other.handleSize) &&
            const DeepCollectionEquality().equals(height, other.height) &&
            const DeepCollectionEquality().equals(width, other.width));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundDeselectedColor),
      const DeepCollectionEquality().hash(backgroundDisabledColor),
      const DeepCollectionEquality().hash(backgroundNullColor),
      const DeepCollectionEquality().hash(backgroundSelectedColor),
      const DeepCollectionEquality().hash(borderRadius),
      const DeepCollectionEquality().hash(handleDeselectedColor),
      const DeepCollectionEquality().hash(handleDisabledColor),
      const DeepCollectionEquality().hash(handleNullColor),
      const DeepCollectionEquality().hash(handleSelectedColor),
      const DeepCollectionEquality().hash(handleSize),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(width),
    );
  }
}
