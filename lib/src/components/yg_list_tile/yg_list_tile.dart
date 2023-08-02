import 'package:flutter/material.dart';
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
  });

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

    final YgListTileTheme theme = context.listTileTheme;

    return Material(
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(theme.splashRadius),
        onTap: onTap,
        child: Padding(
          padding: theme.padding,
          child: Row(
            children: <Widget>[
              if (leadingWidgets.isNotEmpty) _buildLeadingWidgets(theme),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(theme),
                    if (subtitle != null) _buildSubtitle(theme),
                  ].withVerticalSpacing(theme.contentSpacing),
                ),
              ),
              if (supportingWidgets.isNotEmpty) _buildSupportingWidgets(theme),
              if (trailingWidgets.isNotEmpty) _buildTrailingWidgets(theme),
            ].withHorizontalSpacing(theme.contentSpacing),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(YgListTileTheme listTileTheme) {
    const double infoButtonVerticalTranslation = -10.0;
    const EdgeInsets titleHorizontalPaddingForInfoButton = EdgeInsets.only(right: 40.0);

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Padding(
          padding: onInfoTap != null ? titleHorizontalPaddingForInfoButton : EdgeInsets.zero,
          child: Text(
            title,
            style: listTileTheme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onInfoTap != null)
          Positioned(
            right: 0,
            top: infoButtonVerticalTranslation,
            child: _buildInfoButton(listTileTheme),
          ),
      ],
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
      ].withHorizontalSpacing(listTileTheme.contentSpacing),
    );
  }

  Widget _buildInfoButton(YgListTileTheme listTileTheme) {
    return YgIcon(
      YgIcons.info,
      size: YgIconSize.small,
      tapSize: YgIconTapSize.largest,
      onTap: onInfoTap,
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
