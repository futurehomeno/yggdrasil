import 'package:yggdrasil/src/components/buttons/yg_text_link/_yg_text_link.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

enum YgTextLinkState {
  pressed,
  hovered,
  disabled,
  focused,

  small,
  medium,

  strong,
  weak;

  static YgTextLinkState fromSize(YgTextLinkSize size) {
    switch (size) {
      case YgTextLinkSize.medium:
        return medium;
      case YgTextLinkSize.small:
        return small;
    }
  }

  static YgTextLinkState fromWeight(YgTextLinkWeight weight) {
    switch (weight) {
      case YgTextLinkWeight.weak:
        return weak;
      case YgTextLinkWeight.strong:
        return strong;
    }
  }
}

extension YgTextLinkStateSetExtension on Set<YgTextLinkState> {
  YgTextLinkSize get size {
    if (small) {
      return YgTextLinkSize.small;
    }

    return YgTextLinkSize.medium;
  }

  YgTextLinkWeight get weight {
    if (weak) {
      return YgTextLinkWeight.weak;
    }

    return YgTextLinkWeight.strong;
  }

  bool get pressed => contains(YgTextLinkState.pressed);
  bool get hovered => contains(YgTextLinkState.hovered);
  bool get disabled => contains(YgTextLinkState.disabled);
  bool get focused => contains(YgTextLinkState.focused);
  bool get small => contains(YgTextLinkState.small);
  bool get medium => contains(YgTextLinkState.medium);
  bool get strong => contains(YgTextLinkState.strong);
  bool get weak => contains(YgTextLinkState.weak);
}

extension YgTextLinkStatesControllerExtension on YgStatesController<YgTextLinkState> {
  void updateWeight(YgTextLinkWeight weight) {
    update(YgTextLinkState.weak, weight == YgTextLinkWeight.weak);
    update(YgTextLinkState.strong, weight == YgTextLinkWeight.strong);
  }

  void updateSize(YgTextLinkSize size) {
    update(YgTextLinkState.small, size == YgTextLinkSize.small);
    update(YgTextLinkState.medium, size == YgTextLinkSize.medium);
  }
}
