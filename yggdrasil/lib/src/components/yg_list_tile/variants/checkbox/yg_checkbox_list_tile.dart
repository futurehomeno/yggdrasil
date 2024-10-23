import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/_yg_checkbox.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

part 'yg_checkbox_list_tile_dual_state.dart';
part 'yg_checkbox_list_tile_tri_state.dart';

/// Binary (or optionally tri-state) checkbox.
abstract base class YgCheckboxListTile extends StatelessWidget with StatelessWidgetDebugMixin implements YgToggleable {
  const factory YgCheckboxListTile({
    required bool? value,
    required ValueChanged<bool>? onChanged,
    String? title,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    YgListTileDensity density,
  }) = _YgCheckboxListTileDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgCheckboxListTile.triState({
    required bool? value,
    required ValueChanged<bool?>? onChanged,
    String? title,
    Key? key,
    Widget? leadingWidget,
    String? subtitle,
    Widget? subtitleIcon,
    YgListTileDensity density,
  }) = _YgCheckboxListTileTriState;

  const YgCheckboxListTile._({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.density,
    required this.leadingWidget,
    required this.value,
  });

  /// See [YgCheckbox] documentation.
  @override
  final bool? value;

  /// Optional leading widget.
  ///
  /// When provided the [YgCheckbox] will be moved to the trailing position.
  final Widget? leadingWidget;

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
    return YgListTileBody.withChildAndOptionalLeading(
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
      supporting: null,
      infoButton: null,
      child: AbsorbPointer(
        child: YgNoFocus(
          child: _buildCheckbox(),
        ),
      ),
    );
  }

  YgCheckbox _buildCheckbox();
}
