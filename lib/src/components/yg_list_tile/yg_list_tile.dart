import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_checkbox_list_tile.dart';
part 'yg_expanding_list_tile.dart';
part 'yg_list_tile_body.dart';
part 'yg_radio_list_tile.dart';
part 'yg_regular_list_tile.dart';
part 'yg_switch_list_tile.dart';

/// List tile component based on [ListTile] from M3.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
abstract base class YgListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const factory YgListTile({
    Key? key,
    List<Widget>? leadingWidgets,
    void Function()? onInfoTap,
    void Function()? onTap,
    String? subtitle,
    Widget? subtitleIcon,
    List<Widget>? supportingWidgets,
    required String title,
    List<Widget>? trailingWidgets,
  }) = _YgRegularListTile;

  const factory YgListTile.expanding({
    required Widget child,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    List<Widget>? leadingWidgets,
    void Function()? onInfoTap,
    String? subtitle,
    Widget? subtitleIcon,
    List<Widget>? supportingWidgets,
    required String title,
  }) = _YgExpandingListTile;

  const YgListTile._({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.disabled,
  }) : assert(
          subtitleIcon == null || subtitle != null,
          'Can not add a subtitleIcon without a subtitle',
        );

  /// Convenience for generating links from YgListTiles.
  factory YgListTile.link({
    required String link,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return YgListTile(
      title: link,
      leadingWidgets: <YgIcon>[YgIcon(iconPath)],
      trailingWidgets: const <YgIcon>[YgIcon(YgIcons.caretRight)],
      onTap: onTap,
    );
  }

  static const int _allowedNumberOfLeadingWidgets = 2;
  static const int _allowedNumberOfTrailingWidgets = 2;
  static const int _allowedNumberOfSupportingWidgets = 2;

  /// The title.
  ///
  /// Shown in the middle of the list tile when there is no [subtitle], will be
  /// pushed to the top of the list tile if there is a [subtitle].
  final String title;

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
