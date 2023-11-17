import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_checkbox_list_tile.dart';
part 'yg_list_tile_with_child_and_optional_leading.dart';
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
abstract class YgListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const factory YgListTile({
    Key key,
    required String title,
    List<Widget> leadingWidgets,
    List<Widget> supportingWidgets,
    List<Widget> trailingWidgets,
    VoidCallback? onInfoTap,
    VoidCallback? onTap,
    String? subtitle,
    Widget? subtitleIcon,
  }) = _YgRegularListTile;

  const YgListTile._({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleIcon,
    this.disabled = false,
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
      leadingWidgets: <Widget>[YgIcon(iconPath)],
      trailingWidgets: const <Widget>[YgIcon(YgIcons.caretRight)],
      onTap: onTap,
    );
  }

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
  Widget build(BuildContext context) {
    final YgListTileTheme listTileTheme = context.listTileTheme;
    final Widget? leadingWidgets = _buildLeadingWidgets(context);
    final Widget? supportingWidgets = _buildSupportingWidgets(context);
    final Widget? trailingWidgets = _buildTrailingWidgets(context);

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: disabled ? null : _onTap,
        child: Padding(
          padding: listTileTheme.outerPadding,
          child: Row(
            children: <Widget>[
              if (leadingWidgets != null) leadingWidgets,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(context),
                    if (subtitle != null) _buildSubtitle(listTileTheme),
                  ].withVerticalSpacing(listTileTheme.titleSubtitleSpacing),
                ),
              ),
              if (supportingWidgets != null) supportingWidgets,
              if (trailingWidgets != null) trailingWidgets,
            ].withHorizontalSpacing(listTileTheme.contentSpacing),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final Widget? infoButton = _buildInfoButton(context);
    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: listTileTheme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (infoButton != null) infoButton,
      ].withHorizontalSpacing(listTileTheme.titleInfoSpacing),
    );
  }

  Widget _buildSubtitle(YgListTileTheme listTileTheme) {
    return Row(
      children: <Widget>[
        if (subtitleIcon != null) subtitleIcon!,
        Flexible(
          child: Text(
            subtitle!,
            style: listTileTheme.subtitleTextStyle,
          ),
        ),
      ].withHorizontalSpacing(listTileTheme.subtitleSubtitleIconSpacing),
    );
  }

  @protected
  Widget? _buildLeadingWidgets(BuildContext context) => null;

  @protected
  Widget? _buildTrailingWidgets(BuildContext context) => null;

  @protected
  Widget? _buildSupportingWidgets(BuildContext context) => null;

  @protected
  Widget? _buildInfoButton(BuildContext context) => null;

  void _onTap();

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}
