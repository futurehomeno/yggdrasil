// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'yg_gradients.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class YgGradient extends ThemeExtension<YgGradient> {
  const YgGradient({
    required this.backgroundGradient,
    required this.actionPrimaryDefault,
    required this.actionPrimaryHovered,
    required this.actionPrimaryPressed,
    required this.actionPrimarySelected,
    required this.actionSecondarySelected,
    required this.actionSecondaryPressed,
    required this.actionSecondaryHovered,
    required this.actionSecondaryDefault,
  });

  final LinearGradient backgroundGradient;
  final LinearGradient actionPrimaryDefault;
  final LinearGradient actionPrimaryHovered;
  final LinearGradient actionPrimaryPressed;
  final LinearGradient actionPrimarySelected;
  final LinearGradient actionSecondarySelected;
  final LinearGradient actionSecondaryPressed;
  final LinearGradient actionSecondaryHovered;
  final LinearGradient actionSecondaryDefault;

  static final YgGradient consumerLight = YgGradient(
    backgroundGradient: _$YgGradient.backgroundGradient[0],
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[0],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[0],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[0],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[0],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[0],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[0],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[0],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[0],
  );

  static final YgGradient consumerDark = YgGradient(
    backgroundGradient: _$YgGradient.backgroundGradient[1],
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[1],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[1],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[1],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[1],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[1],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[1],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[1],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[1],
  );

  static final YgGradient professionalLight = YgGradient(
    backgroundGradient: _$YgGradient.backgroundGradient[2],
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[2],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[2],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[2],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[2],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[2],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[2],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[2],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[2],
  );

  static final YgGradient professionalDark = YgGradient(
    backgroundGradient: _$YgGradient.backgroundGradient[3],
    actionPrimaryDefault: _$YgGradient.actionPrimaryDefault[3],
    actionPrimaryHovered: _$YgGradient.actionPrimaryHovered[3],
    actionPrimaryPressed: _$YgGradient.actionPrimaryPressed[3],
    actionPrimarySelected: _$YgGradient.actionPrimarySelected[3],
    actionSecondarySelected: _$YgGradient.actionSecondarySelected[3],
    actionSecondaryPressed: _$YgGradient.actionSecondaryPressed[3],
    actionSecondaryHovered: _$YgGradient.actionSecondaryHovered[3],
    actionSecondaryDefault: _$YgGradient.actionSecondaryDefault[3],
  );

  static final themes = [
    consumerLight,
    consumerDark,
    professionalLight,
    professionalDark,
  ];

  @override
  YgGradient copyWith({
    LinearGradient? backgroundGradient,
    LinearGradient? actionPrimaryDefault,
    LinearGradient? actionPrimaryHovered,
    LinearGradient? actionPrimaryPressed,
    LinearGradient? actionPrimarySelected,
    LinearGradient? actionSecondarySelected,
    LinearGradient? actionSecondaryPressed,
    LinearGradient? actionSecondaryHovered,
    LinearGradient? actionSecondaryDefault,
  }) {
    return YgGradient(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      actionPrimaryDefault: actionPrimaryDefault ?? this.actionPrimaryDefault,
      actionPrimaryHovered: actionPrimaryHovered ?? this.actionPrimaryHovered,
      actionPrimaryPressed: actionPrimaryPressed ?? this.actionPrimaryPressed,
      actionPrimarySelected:
          actionPrimarySelected ?? this.actionPrimarySelected,
      actionSecondarySelected:
          actionSecondarySelected ?? this.actionSecondarySelected,
      actionSecondaryPressed:
          actionSecondaryPressed ?? this.actionSecondaryPressed,
      actionSecondaryHovered:
          actionSecondaryHovered ?? this.actionSecondaryHovered,
      actionSecondaryDefault:
          actionSecondaryDefault ?? this.actionSecondaryDefault,
    );
  }

  @override
  YgGradient lerp(ThemeExtension<YgGradient>? other, double t) {
    if (other is! YgGradient) return this;
    return YgGradient(
      backgroundGradient:
          t < 0.5 ? backgroundGradient : other.backgroundGradient,
      actionPrimaryDefault:
          t < 0.5 ? actionPrimaryDefault : other.actionPrimaryDefault,
      actionPrimaryHovered:
          t < 0.5 ? actionPrimaryHovered : other.actionPrimaryHovered,
      actionPrimaryPressed:
          t < 0.5 ? actionPrimaryPressed : other.actionPrimaryPressed,
      actionPrimarySelected:
          t < 0.5 ? actionPrimarySelected : other.actionPrimarySelected,
      actionSecondarySelected:
          t < 0.5 ? actionSecondarySelected : other.actionSecondarySelected,
      actionSecondaryPressed:
          t < 0.5 ? actionSecondaryPressed : other.actionSecondaryPressed,
      actionSecondaryHovered:
          t < 0.5 ? actionSecondaryHovered : other.actionSecondaryHovered,
      actionSecondaryDefault:
          t < 0.5 ? actionSecondaryDefault : other.actionSecondaryDefault,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YgGradient &&
            const DeepCollectionEquality()
                .equals(backgroundGradient, other.backgroundGradient) &&
            const DeepCollectionEquality()
                .equals(actionPrimaryDefault, other.actionPrimaryDefault) &&
            const DeepCollectionEquality()
                .equals(actionPrimaryHovered, other.actionPrimaryHovered) &&
            const DeepCollectionEquality()
                .equals(actionPrimaryPressed, other.actionPrimaryPressed) &&
            const DeepCollectionEquality()
                .equals(actionPrimarySelected, other.actionPrimarySelected) &&
            const DeepCollectionEquality().equals(
                actionSecondarySelected, other.actionSecondarySelected) &&
            const DeepCollectionEquality()
                .equals(actionSecondaryPressed, other.actionSecondaryPressed) &&
            const DeepCollectionEquality()
                .equals(actionSecondaryHovered, other.actionSecondaryHovered) &&
            const DeepCollectionEquality()
                .equals(actionSecondaryDefault, other.actionSecondaryDefault));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(backgroundGradient),
        const DeepCollectionEquality().hash(actionPrimaryDefault),
        const DeepCollectionEquality().hash(actionPrimaryHovered),
        const DeepCollectionEquality().hash(actionPrimaryPressed),
        const DeepCollectionEquality().hash(actionPrimarySelected),
        const DeepCollectionEquality().hash(actionSecondarySelected),
        const DeepCollectionEquality().hash(actionSecondaryPressed),
        const DeepCollectionEquality().hash(actionSecondaryHovered),
        const DeepCollectionEquality().hash(actionSecondaryDefault));
  }
}
