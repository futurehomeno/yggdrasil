import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/yg_icon.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/yg_list_tile_density.dart';
import 'package:yggdrasil/src/components/yg_list_tile/helpers/_helpers.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/generated/icons/_icons.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// List tile component.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
final class YgListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgListTile({
    super.key,
    this.title,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidgets,
    this.trailingWidgets,
    this.supportingWidgets,
    this.onTap,
    this.onInfoTap,
    this.density = YgListTileDensity.standard,
  }) : assert(
         title != null || leadingWidgets != null || subtitle != null,
         'Can not have neither a title, subtitle or leading widget.',
       ),
       assert(
         subtitleIcon == null || subtitle != null,
         'Can not add a subtitleIcon without a subtitle.',
       ),
       assert(
         title != null || onInfoTap == null,
         'Can not have a infoButton without a title.',
       );

  /// Convenience for generating links from YgListTiles.
  factory YgListTile.link({
    required String link,
    required YgIconData icon,
    required VoidCallback onTap,
    YgListTileDensity density = YgListTileDensity.standard,
  }) {
    return YgListTile(
      title: link,
      leadingWidgets: <Widget>[YgIcon(icon)],
      trailingWidgets: const <Widget>[YgIcon(YgIcons.caretRight)],
      onTap: onTap,
      density: density,
    );
  }

  /// Widgets which will be placed at the front of the list tile.
  final List<Widget>? leadingWidgets;

  /// Widgets which will be placed at the end of the list tile.
  final List<Widget>? trailingWidgets;

  /// Up to 2 widgets which will be placed between the content and the trailing widget.
  ///
  /// Will be stacked on top of each other when there is more than one specified.
  final List<Widget>? supportingWidgets;

  /// Called when the list tile is pressed.
  final VoidCallback? onTap;

  /// When provided, shows an info button next to the title.
  ///
  /// Called when the button is pressed.
  final VoidCallback? onInfoTap;

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
    final YgListTileTheme theme = context.listTileTheme;

    return YgListTileBody(
      title: title.safeBuild(
        (String text) => Text(text),
      ),
      subtitle: subtitle.safeBuild(
        (String text) => Text(text),
      ),
      subtitleIcon: subtitleIcon,
      disabled: onTap == null,
      onTap: onTap,
      density: density,
      infoButton: YgListTileHelpers.buildInfoButton(onInfoTap),
      leading: YgListTileHelpers.buildLeading(theme, leadingWidgets),
      trailing: YgListTileHelpers.buildTrailing(theme, trailingWidgets),
      supporting: YgListTileHelpers.buildSupporting(theme, supportingWidgets),
      builder: null,
    );
  }

  @override
  YgDebugType get debugType {
    if (onTap == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
