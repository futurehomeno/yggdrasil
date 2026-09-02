/// Predefined looks for the tiles of a [YgTileSelector].
enum YgTileSelectorVariant {
  /// Tiles with a background fill and a filled circle behind the icon.
  ///
  /// The selection is carried by the tinted fill, the accent border and the
  /// accent circle behind the icon.
  filled,

  /// Lightweight tiles with only a hairline border and no background fill.
  ///
  /// The icon is shown without a circle behind it and the selection is
  /// carried by the accent border and the accent tint of the icon and label.
  outlined,
}
