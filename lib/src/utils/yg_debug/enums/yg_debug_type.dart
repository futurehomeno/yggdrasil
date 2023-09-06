// TODO(Tim): Should probably come up with a better set of types that are more meaningful to debugging widget sizes.

/// List of widget types that have debugging support.
enum YgDebugType {
  /// Widgets that are not visible, but determine the placing of other widgets.
  layout,

  /// All widgets that support some type of interaction.
  intractable,

  /// All widgets that are not intractable nor layout components.
  other,
}
