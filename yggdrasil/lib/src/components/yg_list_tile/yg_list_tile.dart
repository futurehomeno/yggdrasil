import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'helpers/_helpers.dart';
import 'widgets/_widgets.dart';

part 'variants/checkbox/yg_checkbox_list_tile.dart';
part 'variants/checkbox/yg_checkbox_list_tile_dual_state.dart';
part 'variants/checkbox/yg_checkbox_list_tile_tri_state.dart';
part 'variants/switch/yg_switch_list_tile.dart';
part 'variants/switch/yg_switch_list_tile_dual_state.dart';
part 'variants/switch/yg_switch_list_tile_tri_state.dart';
part 'variants/yg_expanding_list_tile.dart';
part 'variants/yg_radio_list_tile.dart';
part 'variants/yg_regular_list_tile.dart';

/// List tile component.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
abstract base class YgListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const factory YgListTile({
    String? title,
    Key? key,
    String? subtitle,
    Widget? subtitleIcon,
    VoidCallback? onInfoTap,
    VoidCallback? onTap,
    List<Widget>? leadingWidgets,
    List<Widget>? supportingWidgets,
    List<Widget>? trailingWidgets,
  }) = _YgRegularListTile;

  const YgListTile._({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.disabled,
  });

  /// Convenience for generating links from YgListTiles.
  factory YgListTile.link({
    required String link,
    required YgIconData icon,
    required VoidCallback onTap,
  }) {
    return YgListTile(
      title: link,
      leadingWidgets: <Widget>[YgIcon(icon)],
      trailingWidgets: const <Widget>[YgIcon(YgIcons.caretRight)],
      onTap: onTap,
    );
  }

  /// The title.
  ///
  /// Shown in the middle of the list tile when there is no [subtitle], will be
  /// pushed to the top of the list tile if there is a [subtitle].
  final String? title;

  /// The subtitle.
  ///
  /// Shown below the [title].
  final String? subtitle;

  /// Small icon shown in front of [subtitle].
  ///
  /// Can not be provided when there is no subtitle.
  final Widget? subtitleIcon;

  /// Disables touch interaction when true.
  ///
  /// Does not create any visual changes.
  final bool disabled;

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
