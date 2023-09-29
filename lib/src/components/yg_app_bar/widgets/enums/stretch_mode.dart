/// The stretching effect while the space bar stretches beyond its full size.
enum StretchMode {
  /// The background widget will expand to fill the extra space.
  zoomBackground,

  /// The background will blur using a [ImageFilter.blur] effect.
  blurBackground,

  /// The title will fade away as the user over-scrolls.
  fadeTitle,
}
