import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/yg_list_tile_density.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/components/yg_switch/yg_switch.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_switch_list_tile_dual_state.dart';
part 'yg_switch_list_tile_tri_state.dart';

/// Binary (or optionally tri-state) switch.
abstract base class YgSwitchListTile extends StatelessWidget with StatelessWidgetDebugMixin implements YgToggleable {
  const factory YgSwitchListTile({
    Key? key,
    required bool? value,
    required ValueChanged<bool>? onChanged,
    String? title,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
    YgListTileDensity density,
  }) = _YgSwitchListTileDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgSwitchListTile.triState({
    Key? key,
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? title,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    Widget? trailingWidget,
    YgListTileDensity density,
  }) = _YgSwitchListTileTriState;

  const YgSwitchListTile._({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.density,
    required this.leadingWidget,
    required this.trailingWidget,
    required this.value,
  });

  /// See [YgSwitch] documentation.
  @override
  final bool? value;

  /// Optional widget to display before the title.
  final Widget? leadingWidget;

  /// Optional widget to display before the switch.
  final Widget? trailingWidget;

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

  /// The density of the list tile.
  ///
  /// Defaults to [YgListTileDensity.standard].
  final YgListTileDensity density;

  @override
  Widget build(BuildContext context) {
    return YgListTileBody(
      builder: null,
      density: density,
      title: title.safeBuild(
        (String text) => Text(text),
      ),
      subtitle: subtitle.safeBuild(
        (String text) => Text(text),
      ),
      subtitleIcon: subtitleIcon,
      disabled: disabled,
      onTap: toggle,
      leading: leadingWidget,
      trailing: Row(
        children: <Widget>[
          if (trailingWidget != null) trailingWidget!,
          AbsorbPointer(
            child: YgNoFocus(
              child: _buildSwitch(),
            ),
          ),
        ],
      ),
      supporting: null,
      infoButton: null,
    );
  }

  YgSwitch _buildSwitch();
}
