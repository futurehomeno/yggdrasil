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
