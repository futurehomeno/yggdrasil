import 'package:flutter/widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// A group of positions shown in a single card inside a [YgSettingSection].
class YgSettingGroup {
  const YgSettingGroup({
    required this.positions,
    this.name,
  });

  /// Name of the group, rendered as a header above the card.
  ///
  /// When null, the card is rendered without a header.
  final String? name;

  /// The positions of the group, normally [YgListTile] widgets.
  ///
  /// Positions are separated by dividers. When empty, the group is not
  /// rendered at all.
  final List<Widget> positions;
}
