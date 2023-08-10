import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// List tile component based on [ListTile] from M3.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
class YgListTile extends StatelessWidget {
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
  });

  /// Convenience for generating links from YgListTiles.
  factory YgListTile.link({
    required String link,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return YgListTile(
      title: link,
      leadingWidgets: <Widget>[YgIcon(iconPath)],
      onTap: onTap,
    );
  }

  final String title;
  final String? subtitle;
  final Widget? subtitleIcon;
  final List<Widget> leadingWidgets;
  final List<Widget> trailingWidgets;
  final List<Widget> supportingWidgets;
  final VoidCallback? onTap;
  final VoidCallback? onInfoTap;

  @override
  Widget build(BuildContext context) {
    assert(leadingWidgets.length <= 2, 'Cannot have more than 2 leading widgets.');
    assert(trailingWidgets.length <= 2, 'Cannot have more than 2 trailing widget.');
    assert(supportingWidgets.length <= 2, 'Cannot have more than 2 supporting widgets.');

    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Material(
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(listTileTheme.splashRadius),
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
        Text(
          title,
          style: listTileTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
        if (onInfoTap != null) _buildInfoButton(listTileTheme),
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

  Widget _buildInfoButton(YgListTileTheme listTileTheme) {
    return YgIconButton(
      onPressed: onInfoTap,
      size: YgIconButtonSize.small,
      child: const YgIcon(YgIcons.info),
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
}
