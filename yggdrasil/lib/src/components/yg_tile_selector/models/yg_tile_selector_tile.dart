import 'package:yggdrasil/yggdrasil.dart';

/// A tile of a [YgTileSelector].
class YgTileSelectorTile<T extends Object?> {
  const YgTileSelectorTile({
    required this.value,
    required this.icon,
    required this.label,
    this.disabled = false,
  });

  /// The value used to determine if this tile is selected.
  final T value;

  /// The icon shown in the circle of this tile.
  final YgColorableIconData icon;

  /// The label shown below the icon of this tile.
  final String label;

  /// Whether this tile can not be selected, for example because the mode it
  /// represents is currently unavailable.
  ///
  /// A disabled tile is still shown, but does not respond to user input. To
  /// disable the whole selector pass null to [YgTileSelector.onValueChanged]
  /// instead.
  final bool disabled;
}
