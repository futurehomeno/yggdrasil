import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// List tile component based on [ListTile] from M3.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
class YgListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidgets = const <YgIcon>[],
    this.trailingWidgets = const <YgIcon>[],
    this.supportingWidgets = const <Widget>[],
    this.onTap,
    this.onInfoTap,
  }) : assert(subtitleIcon == null || subtitle != null, 'Can not add a subtitleIcon without a subtitle');

  /// Convenience for generating links from YgListTiles.
  factory YgListTile.link({
    required String link,
    required YgIconData icon,
    required VoidCallback onTap,
  }) {
    return YgListTile(
      title: link,
      leadingWidgets: <Widget>[YgIcon.embeddedColor(icon)],
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

  /// Widgets which will be placed at the front of the list tile.
  final List<Widget> leadingWidgets;

  /// Widgets which will be placed at the end of the list tile.
  final List<Widget> trailingWidgets;

  /// Up to 2 widgets which will be placed between the content and the trailing widget.
  ///
  /// Will be stacked on top of each other when there is more than one specified.
  final List<Widget> supportingWidgets;

  /// Called when the list tile is pressed.
  final VoidCallback? onTap;

  /// When provided, shows an info button next to the title.
  ///
  /// Called when the button is pressed.
  final VoidCallback? onInfoTap;

  static const int _allowedNumberOfLeadingWidgets = 2;
  static const int _allowedNumberOfTrailingWidgets = 2;
  static const int _allowedNumberOfSupportingWidgets = 2;

  @override
  Widget build(BuildContext context) {
    // TODO(DEV-1920): This is not ideal, maybe look in to something using records so we can create a limit in widgets without asserts?
    assert(leadingWidgets.length <= _allowedNumberOfLeadingWidgets, 'Cannot have more than 2 leading widgets.');
    assert(trailingWidgets.length <= _allowedNumberOfTrailingWidgets, 'Cannot have more than 2 trailing widget.');
    assert(
        supportingWidgets.length <= _allowedNumberOfSupportingWidgets, 'Cannot have more than 2 supporting widgets.');

    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: listTileTheme.outerPadding,
          child: Row(
            children: <Widget>[
              if (leadingWidgets.isNotEmpty) _buildLeadingWidgets(listTileTheme),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(listTileTheme),
                    if (subtitle != null) _buildSubtitle(listTileTheme),
                  ].withVerticalSpacing(listTileTheme.titleSubtitleSpacing),
                ),
              ),
              if (supportingWidgets.isNotEmpty) _buildSupportingWidgets(listTileTheme),
              if (trailingWidgets.isNotEmpty) _buildTrailingWidgets(listTileTheme),
            ].withHorizontalSpacing(listTileTheme.contentSpacing),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(YgListTileTheme listTileTheme) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: listTileTheme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onInfoTap != null) _buildInfoButton(),
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

  Widget _buildInfoButton() {
    return YgIconButton(
      onPressed: onInfoTap,
      size: YgIconButtonSize.small,
      icon: YgIcons.info,
    );
  }

  Widget _buildLeadingWidgets(YgListTileTheme listTileTheme) {
    return Row(
      children: leadingWidgets.withHorizontalSpacing(listTileTheme.contentSpacing),
    );
  }

  Widget _buildTrailingWidgets(YgListTileTheme listTileTheme) {
    return Row(
      children: trailingWidgets.withHorizontalSpacing(listTileTheme.contentSpacing),
    );
  }

  Widget _buildSupportingWidgets(YgListTileTheme listTileTheme) {
    return Column(
      children: supportingWidgets.withVerticalSpacing(listTileTheme.contentSpacing),
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
