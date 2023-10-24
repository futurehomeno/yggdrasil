import 'package:yggdrasil/yggdrasil.dart';

enum YgButtonState {
  disabled,
  focused,
  hovered,
  pressed,

  small,
  medium,
  large,

  primary,
  secondary,
  text,
  critical,
  link;

  /// Convert [YgButtonVariant] to [YgButtonState].
  static YgButtonState fromVariant(YgButtonVariant variant) {
    switch (variant) {
      case YgButtonVariant.primary:
        return primary;
      case YgButtonVariant.secondary:
        return secondary;
      case YgButtonVariant.text:
        return text;
      case YgButtonVariant.critical:
        return critical;
      case YgButtonVariant.link:
        return link;
    }
  }

  /// Convert [YgButtonSize] to [YgButtonState].
  static YgButtonState fromSize(YgButtonSize size) {
    switch (size) {
      case YgButtonSize.large:
        return large;
      case YgButtonSize.medium:
        return medium;
      case YgButtonSize.small:
        return small;
    }
  }
}

extension YgButtonStatesExtension on Set<YgButtonState> {
  YgButtonVariant get variant {
    if (secondary) {
      return YgButtonVariant.secondary;
    }
    if (text) {
      return YgButtonVariant.text;
    }
    if (critical) {
      return YgButtonVariant.critical;
    }
    if (link) {
      return YgButtonVariant.link;
    }

    return YgButtonVariant.primary;
  }

  YgButtonSize get size {
    if (small) {
      return YgButtonSize.small;
    }
    if (medium) {
      return YgButtonSize.medium;
    }

    return YgButtonSize.large;
  }

  bool get focused => contains(YgButtonState.focused);
  bool get hovered => contains(YgButtonState.hovered);
  bool get disabled => contains(YgButtonState.disabled);
  bool get pressed => contains(YgButtonState.pressed);
  bool get small => contains(YgButtonState.small);
  bool get medium => contains(YgButtonState.medium);
  bool get large => contains(YgButtonState.large);
  bool get primary => contains(YgButtonState.primary);
  bool get secondary => contains(YgButtonState.secondary);
  bool get text => contains(YgButtonState.text);
  bool get critical => contains(YgButtonState.critical);
  bool get link => contains(YgButtonState.link);
}

extension YgButtonStatesControllerExtension on YgStatesController<YgButtonState> {
  void updateVariant(YgButtonVariant variant) {
    update(YgButtonState.primary, variant == YgButtonVariant.primary);
    update(YgButtonState.secondary, variant == YgButtonVariant.secondary);
    update(YgButtonState.text, variant == YgButtonVariant.text);
    update(YgButtonState.critical, variant == YgButtonVariant.critical);
    update(YgButtonState.link, variant == YgButtonVariant.link);
  }

  void updateSize(YgButtonSize size) {
    update(YgButtonState.small, size == YgButtonSize.small);
    update(YgButtonState.medium, size == YgButtonSize.medium);
    update(YgButtonState.large, size == YgButtonSize.large);
  }
}
