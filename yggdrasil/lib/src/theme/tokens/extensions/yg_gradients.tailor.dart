// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'yg_gradients.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

class YgGradient extends ThemeExtension<YgGradient> {
  const YgGradient({
    required this.actionPrimaryDefault,
    required this.actionPrimaryHovered,
    required this.actionPrimaryPressed,
    required this.actionPrimarySelected,
    required this.actionSecondaryDefault,
    required this.actionSecondaryHovered,
    required this.actionSecondaryPressed,
    required this.actionSecondarySelected,
    required this.backgroundGradient,
  });

  final Gradient actionPrimaryDefault;
  final Gradient actionPrimaryHovered;
  final Gradient actionPrimaryPressed;
  final Gradient actionPrimarySelected;
  final Gradient actionSecondaryDefault;
  final Gradient actionSecondaryHovered;
  final Gradient actionSecondaryPressed;
  final Gradient actionSecondarySelected;
  final Gradient backgroundGradient;

  static final YgGradient consumerLight = YgGradient(
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[0],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[0],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[0],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[0],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[0],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[0],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[0],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[0],
    backgroundGradient: _$YgGradient.backgroundGradient[0],
  );

  static final YgGradient consumerDark = YgGradient(
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[1],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[1],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[1],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[1],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[1],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[1],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[1],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[1],
    backgroundGradient: _$YgGradient.backgroundGradient[1],
  );

  static final YgGradient professionalLight = YgGradient(
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[2],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[2],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[2],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[2],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[2],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[2],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[2],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[2],
    backgroundGradient: _$YgGradient.backgroundGradient[2],
  );

  static final YgGradient professionalDark = YgGradient(
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[3],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[3],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[3],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[3],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[3],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[3],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[3],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[3],
    backgroundGradient: _$YgGradient.backgroundGradient[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgGradient copyWith({
    Gradient? actionPrimaryDefault,
    Gradient? actionPrimaryHovered,
    Gradient? actionPrimaryPressed,
    Gradient? actionPrimarySelected,
    Gradient? actionSecondaryDefault,
    Gradient? actionSecondaryHovered,
    Gradient? actionSecondaryPressed,
    Gradient? actionSecondarySelected,
    Gradient? backgroundGradient,
  }) {
    return YgGradient(
      actionPrimaryDefault: actionPrimaryDefault ?? this.actionPrimaryDefault,
      actionPrimaryHovered: actionPrimaryHovered ?? this.actionPrimaryHovered,
      actionPrimaryPressed: actionPrimaryPressed ?? this.actionPrimaryPressed,
      actionPrimarySelected: actionPrimarySelected ?? this.actionPrimarySelected,
      actionSecondaryDefault: actionSecondaryDefault ?? this.actionSecondaryDefault,
      actionSecondaryHovered: actionSecondaryHovered ?? this.actionSecondaryHovered,
      actionSecondaryPressed: actionSecondaryPressed ?? this.actionSecondaryPressed,
      actionSecondarySelected: actionSecondarySelected ?? this.actionSecondarySelected,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  YgGradient lerp(covariant ThemeExtension<YgGradient>? other, double t) {
    if (other is! YgGradient) return this as YgGradient;
    return YgGradient(
      actionPrimaryDefault: t < 0.5 ? actionPrimaryDefault : other.actionPrimaryDefault,
      actionPrimaryHovered: t < 0.5 ? actionPrimaryHovered : other.actionPrimaryHovered,
      actionPrimaryPressed: t < 0.5 ? actionPrimaryPressed : other.actionPrimaryPressed,
      actionPrimarySelected: t < 0.5 ? actionPrimarySelected : other.actionPrimarySelected,
      actionSecondaryDefault: t < 0.5 ? actionSecondaryDefault : other.actionSecondaryDefault,
      actionSecondaryHovered: t < 0.5 ? actionSecondaryHovered : other.actionSecondaryHovered,
      actionSecondaryPressed: t < 0.5 ? actionSecondaryPressed : other.actionSecondaryPressed,
      actionSecondarySelected: t < 0.5 ? actionSecondarySelected : other.actionSecondarySelected,
      backgroundGradient: t < 0.5 ? backgroundGradient : other.backgroundGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgGradient &&
            const DeepCollectionEquality().equals(actionPrimaryDefault, other.actionPrimaryDefault) &&
            const DeepCollectionEquality().equals(actionPrimaryHovered, other.actionPrimaryHovered) &&
            const DeepCollectionEquality().equals(actionPrimaryPressed, other.actionPrimaryPressed) &&
            const DeepCollectionEquality().equals(actionPrimarySelected, other.actionPrimarySelected) &&
            const DeepCollectionEquality().equals(actionSecondaryDefault, other.actionSecondaryDefault) &&
            const DeepCollectionEquality().equals(actionSecondaryHovered, other.actionSecondaryHovered) &&
            const DeepCollectionEquality().equals(actionSecondaryPressed, other.actionSecondaryPressed) &&
            const DeepCollectionEquality().equals(actionSecondarySelected, other.actionSecondarySelected) &&
            const DeepCollectionEquality().equals(backgroundGradient, other.backgroundGradient));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(actionPrimaryDefault),
      const DeepCollectionEquality().hash(actionPrimaryHovered),
      const DeepCollectionEquality().hash(actionPrimaryPressed),
      const DeepCollectionEquality().hash(actionPrimarySelected),
      const DeepCollectionEquality().hash(actionSecondaryDefault),
      const DeepCollectionEquality().hash(actionSecondaryHovered),
      const DeepCollectionEquality().hash(actionSecondaryPressed),
      const DeepCollectionEquality().hash(actionSecondarySelected),
      const DeepCollectionEquality().hash(backgroundGradient),
    );
  }
}
