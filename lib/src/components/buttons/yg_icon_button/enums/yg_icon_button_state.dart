import 'package:yggdrasil/yggdrasil.dart';

enum YgIconButtonState {
  // States
  disabled,
  focused,
  hovered,
  pressed,

  // Sizes
  small,
  medium,

  // Variants
  standard,
  filled,
  tonal,
  outlined;

  static YgIconButtonState fromSize(YgIconButtonSize size) {
    switch (size) {
      case YgIconButtonSize.medium:
        return medium;
      case YgIconButtonSize.small:
        return small;
    }
  }

  static YgIconButtonState fromVariant(YgIconButtonVariant variant) {
    switch (variant) {
      case YgIconButtonVariant.filled:
        return filled;
      case YgIconButtonVariant.outlined:
        return outlined;
      case YgIconButtonVariant.standard:
        return standard;
      case YgIconButtonVariant.tonal:
        return tonal;
    }
  }
}

extension YgIconButtonStateSetExtension on Set<YgIconButtonState> {
  YgIconButtonSize get size {
    if (small) {
      return YgIconButtonSize.small;
    }

    return YgIconButtonSize.medium;
  }

  YgIconButtonVariant get variant {
    if (filled) {
      return YgIconButtonVariant.filled;
    }

    if (outlined) {
      return YgIconButtonVariant.outlined;
    }

    if (tonal) {
      return YgIconButtonVariant.tonal;
    }

    return YgIconButtonVariant.standard;
  }

  // States
  bool get disabled => contains(YgIconButtonState.disabled);
  bool get focused => contains(YgIconButtonState.focused);
  bool get hovered => contains(YgIconButtonState.hovered);
  bool get pressed => contains(YgIconButtonState.pressed);

  // Sizes
  bool get small => contains(YgIconButtonState.small);
  bool get medium => contains(YgIconButtonState.medium);

  // Variants
  bool get standard => contains(YgIconButtonState.standard);
  bool get filled => contains(YgIconButtonState.filled);
  bool get tonal => contains(YgIconButtonState.tonal);
  bool get outlined => contains(YgIconButtonState.outlined);
}

extension YgIconButtonStatesController on YgStatesController<YgIconButtonState> {
  void updateSize(YgIconButtonSize size) {
    update(YgIconButtonState.medium, size == YgIconButtonSize.medium);
    update(YgIconButtonState.small, size == YgIconButtonSize.small);
  }

  void updateVariant(YgIconButtonVariant variant) {
    update(YgIconButtonState.filled, variant == YgIconButtonVariant.filled);
    update(YgIconButtonState.outlined, variant == YgIconButtonVariant.outlined);
    update(YgIconButtonState.tonal, variant == YgIconButtonVariant.tonal);
    update(YgIconButtonState.standard, variant == YgIconButtonVariant.standard);
  }
}
