import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The sizing of a [YgTileSelectorSize] resolved against the current theme.
///
/// Used internally by the [YgTileSelector], not part of the public api.
class YgTileSelectorSpec {
  const YgTileSelectorSpec({
    required this.iconSize,
    required this.labelSpacing,
    required this.padding,
    required this.labelStyle,
    required this.borderRadius,
    required this.tileSpacing,
    required this.scrollTileGutter,
  });

  factory YgTileSelectorSpec.resolve(BuildContext context, YgTileSelectorSize size) {
    final YgDimension dimensions = context.tokens.dimensions;
    final YgTextStyle textStyles = context.tokens.textStyles;
    final YgRadius radii = context.tokens.radii;
    final double scrollTileGutter = dimensions.md;

    return switch (size) {
      YgTileSelectorSize.small => YgTileSelectorSpec(
          iconSize: dimensions.md,
          labelSpacing: dimensions.xxs,
          padding: EdgeInsets.symmetric(
            vertical: dimensions.xs,
            horizontal: dimensions.xxs,
          ),
          labelStyle: textStyles.caption1Medium,
          borderRadius: radii.sm,
          tileSpacing: dimensions.xxs,
          scrollTileGutter: scrollTileGutter,
        ),
      YgTileSelectorSize.medium => YgTileSelectorSpec(
          iconSize: dimensions.lg,
          labelSpacing: dimensions.xxs,
          padding: EdgeInsets.symmetric(
            vertical: dimensions.sm,
            horizontal: dimensions.xs,
          ),
          labelStyle: textStyles.paragraph3Medium,
          borderRadius: radii.md,
          tileSpacing: dimensions.xs,
          scrollTileGutter: scrollTileGutter,
        ),
      YgTileSelectorSize.large => YgTileSelectorSpec(
          iconSize: dimensions.xl,
          labelSpacing: dimensions.xs,
          padding: EdgeInsets.symmetric(
            vertical: dimensions.md,
            horizontal: dimensions.xs,
          ),
          labelStyle: textStyles.paragraph2Medium,
          borderRadius: radii.lg,
          tileSpacing: dimensions.xs,
          scrollTileGutter: scrollTileGutter,
        ),
    };
  }

  /// Size of the icon glyph, the circle behind it is twice this size.
  final double iconSize;

  /// Spacing between the icon circle and the label.
  final double labelSpacing;

  /// Padding between the tile edge and its content.
  final EdgeInsets padding;

  /// Text style of the label, the color is resolved per state.
  final TextStyle labelStyle;

  /// Corner radius of the tile.
  final BorderRadius borderRadius;

  /// Spacing between the tiles of the selector.
  final double tileSpacing;

  /// Horizontal room between the icon circle and the tile edge when the
  /// selector scrolls, see [scrollTileWidth].
  final double scrollTileGutter;

  /// Diameter of the circle behind the icon.
  double get circleSize => iconSize * 2;

  /// Fixed tile width used when the selector scrolls.
  double get scrollTileWidth => circleSize + scrollTileGutter * 2;
}
