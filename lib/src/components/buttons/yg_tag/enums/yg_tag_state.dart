import 'package:yggdrasil/yggdrasil.dart';

import '_enums.dart';

enum YgTagState {
  // States
  disabled,
  focused,
  hovered,
  pressed,

  // Variants
  neutral,
  informative,
  positive,
  warning,
  negative,

  // Weights
  strong,
  weak,

  // Sizes
  small,
  medium;

  static YgTagState fromVariant(YgTagVariant variant) {
    switch (variant) {
      case YgTagVariant.neutral:
        return neutral;
      case YgTagVariant.informative:
        return informative;
      case YgTagVariant.positive:
        return positive;
      case YgTagVariant.warning:
        return warning;
      case YgTagVariant.negative:
        return negative;
    }
  }

  static YgTagState fromWeight(YgTagWeight weight) {
    switch (weight) {
      case YgTagWeight.strong:
        return strong;
      case YgTagWeight.weak:
        return weak;
    }
  }

  static YgTagState fromSize(YgTagSize size) {
    switch (size) {
      case YgTagSize.small:
        return small;
      case YgTagSize.medium:
        return medium;
    }
  }
}

extension YgTagStateSetExtension on Set<YgTagState> {
  YgTagVariant get variant {
    if (informative) {
      return YgTagVariant.informative;
    }
    if (positive) {
      return YgTagVariant.positive;
    }
    if (warning) {
      return YgTagVariant.warning;
    }
    if (negative) {
      return YgTagVariant.negative;
    }

    return YgTagVariant.neutral;
  }

  YgTagWeight get weight {
    if (strong) {
      return YgTagWeight.strong;
    }

    return YgTagWeight.weak;
  }

  YgTagSize get size {
    if (small) {
      return YgTagSize.small;
    }

    return YgTagSize.medium;
  }

  bool get disabled => contains(YgTagState.disabled);
  bool get focused => contains(YgTagState.focused);
  bool get hovered => contains(YgTagState.hovered);
  bool get pressed => contains(YgTagState.pressed);

  // Variants
  bool get neutral => contains(YgTagState.neutral);
  bool get informative => contains(YgTagState.informative);
  bool get positive => contains(YgTagState.positive);
  bool get warning => contains(YgTagState.warning);
  bool get negative => contains(YgTagState.negative);

  // Weights
  bool get strong => contains(YgTagState.strong);
  bool get weak => contains(YgTagState.weak);

  // Sizes
  bool get small => contains(YgTagState.small);
  bool get medium => contains(YgTagState.medium);
}

extension YgTagStatesControllerExtension on YgStatesController<YgTagState> {
  void updateVariant(YgTagVariant variant) {
    update(YgTagState.neutral, variant == YgTagVariant.neutral);
    update(YgTagState.informative, variant == YgTagVariant.informative);
    update(YgTagState.positive, variant == YgTagVariant.positive);
    update(YgTagState.warning, variant == YgTagVariant.warning);
    update(YgTagState.negative, variant == YgTagVariant.negative);
  }

  void updateWeight(YgTagWeight weight) {
    update(YgTagState.strong, weight == YgTagWeight.strong);
    update(YgTagState.weak, weight == YgTagWeight.weak);
  }

  void updateSize(YgTagSize size) {
    update(YgTagState.small, size == YgTagSize.small);
    update(YgTagState.medium, size == YgTagSize.medium);
  }
}
