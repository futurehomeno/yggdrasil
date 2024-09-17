part of '../yg_list_tile.dart';

/// List tile component based on [ListTile] from M3.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
final class _YgRegularListTile extends YgListTile {
  const _YgRegularListTile({
    super.key,
    super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidgets,
    this.trailingWidgets,
    this.supportingWidgets,
    this.onTap,
    this.onInfoTap,
    super.density = YgListTileDensity.standard,
  })  : assert(
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
        ),
        super._(
          disabled: onTap == null,
        );

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

  @override
  Widget build(BuildContext context) {
    final YgListTileTheme theme = context.listTileTheme;

    return YgListTileBody(
      title: title.asText(),
      subtitle: subtitle.asText(),
      subtitleIcon: subtitleIcon,
      disabled: disabled,
      onTap: onTap,
      density: density,
      infoButton: YgListTileHelpers.buildInfoButton(onInfoTap),
      leading: YgListTileHelpers.buildLeading(theme, leadingWidgets),
      trailing: YgListTileHelpers.buildTrailing(theme, trailingWidgets),
      supporting: YgListTileHelpers.buildSupporting(theme, supportingWidgets),
      builder: null,
    );
  }
}
