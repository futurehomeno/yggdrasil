import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tile_selector/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A single select control made up of large icon tiles.
///
/// A lightweight alternative to the [YgSegmentedButton] for choices which
/// deserve more visual weight, for example the mode of a thermostat. Every
/// [YgTileSelectorTile] is shown as a tile with a big icon in a circle and a
/// label below it, exactly one tile is selected at a time, like a radio
/// group.
///
/// Up to 5 tiles share the available width equally, with more tiles the
/// selector becomes a horizontally scrollable row of fixed width tiles.
///
/// Comes in two looks, see [YgTileSelectorVariant]: the default
/// [YgTileSelectorVariant.filled] with a background fill and a circle behind
/// the icon, and the lightweight [YgTileSelectorVariant.outlined] with only
/// a hairline border.
///
/// While pressed a tile scales down, on release it springs back with a small
/// bounce. When animations are disabled on the device only the selection
/// colors change.
class YgTileSelector<T extends Object?> extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgTileSelector({
    super.key,
    required this.tiles,
    required this.value,
    required this.onValueChanged,
    this.size = YgTileSelectorSize.medium,
    this.variant = YgTileSelectorVariant.filled,
  });

  /// Highest amount of tiles still shown without scrolling.
  static const int _maxTilesWithoutScrolling = 5;

  /// The tiles of this selector.
  final List<YgTileSelectorTile<T>> tiles;

  /// The current value of this selector.
  final T value;

  /// Called when the user selects a tile.
  ///
  /// The whole selector is disabled when null. To disable a single tile use
  /// [YgTileSelectorTile.disabled] instead.
  final ValueChanged<T>? onValueChanged;

  /// The size of the tiles, see [YgTileSelectorSize].
  final YgTileSelectorSize size;

  /// The look of the tiles, see [YgTileSelectorVariant].
  final YgTileSelectorVariant variant;

  @override
  Widget build(BuildContext context) {
    assert(
      tiles.length >= 2,
      'Can not have less than 2 tiles.',
    );

    final YgTileSelectorSpec spec = YgTileSelectorSpec.resolve(context, size);
    final List<YgTileSelectorTileButton> tileButtons = tiles
        .map(
          (YgTileSelectorTile<T> tile) => YgTileSelectorTileButton(
            onPressed: _isTileDisabled(tile) ? null : () => onValueChanged?.call(tile.value),
            selected: tile.value == value,
            icon: tile.icon,
            label: tile.label,
            spec: spec,
            variant: variant,
          ),
        )
        .toList();

    if (tiles.length <= _maxTilesWithoutScrolling) {
      return Row(
        children: tileButtons
            .map<Widget>((YgTileSelectorTileButton tile) => Expanded(child: tile))
            .toList()
            .withHorizontalSpacing(spec.tileSpacing),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tileButtons
            .map<Widget>(
              (YgTileSelectorTileButton tile) => SizedBox(
                width: spec.scrollTileWidth,
                child: tile,
              ),
            )
            .toList()
            .withHorizontalSpacing(spec.tileSpacing),
      ),
    );
  }

  bool _isTileDisabled(YgTileSelectorTile<T> tile) {
    return tile.disabled || onValueChanged == null;
  }

  @override
  YgDebugType get debugType => YgDebugType.intractable;
}
