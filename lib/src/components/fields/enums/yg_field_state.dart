import 'package:yggdrasil/yggdrasil.dart';

/// All the states any yggdrasil field can be in.
///
/// !--- IMPORTANT ---
/// Internal enum, should not be exposed.
///
/// Also contains variants as these are also states the widget can be in, for
/// example, a field can be large and outlined.
enum YgFieldState {
  focused,
  hovered,
  disabled,
  error,
  filled,
  opened,

  placeholder,
  suffix,
  floatLabel,

  // Variants
  outlined,
  standard,

  // Sizes
  medium,
  large;

  /// Convert [YgFieldVariant] to [YgFieldState].
  static YgFieldState fromVariant(YgFieldVariant variant) {
    switch (variant) {
      case YgFieldVariant.outlined:
        return outlined;
      case YgFieldVariant.standard:
        return standard;
    }
  }

  /// Convert [YgFieldSize] to [YgFieldState].
  static YgFieldState fromSize(YgFieldSize size) {
    switch (size) {
      case YgFieldSize.large:
        return large;
      case YgFieldSize.medium:
        return medium;
    }
  }
}

extension YgFieldStatesExtension on Set<YgFieldState> {
  YgFieldVariant get variant {
    if (outlined) {
      return YgFieldVariant.outlined;
    }

    return YgFieldVariant.standard;
  }

  YgFieldSize get size {
    if (medium) {
      return YgFieldSize.medium;
    }

    return YgFieldSize.large;
  }

  bool get focused => contains(YgFieldState.focused);
  bool get hovered => contains(YgFieldState.hovered);
  bool get disabled => contains(YgFieldState.disabled);
  bool get error => contains(YgFieldState.error);
  bool get filled => contains(YgFieldState.filled);
  bool get opened => contains(YgFieldState.opened);

  bool get placeholder => contains(YgFieldState.placeholder);
  bool get suffix => contains(YgFieldState.suffix);

  // Variants
  bool get outlined => contains(YgFieldState.outlined);
  bool get standard => contains(YgFieldState.standard);

  // Sizes
  bool get medium => contains(YgFieldState.medium);
  bool get large => contains(YgFieldState.large);
}
