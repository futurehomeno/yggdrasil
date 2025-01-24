enum YgFooterBehavior {
  /// Footer sticks to the bottom of the screen.
  ///
  /// The footer will always be positioned at the bottom of the screen,
  /// regardless of the content height.
  sticky,

  /// Footer sticks to the bottom unless content is taller.
  ///
  /// The footer will be positioned at the bottom of the screen unless
  /// the main content height exceeds the remaining screen space, in which
  /// case the footer will be pushed down off the screen.
  pushDown,
}
