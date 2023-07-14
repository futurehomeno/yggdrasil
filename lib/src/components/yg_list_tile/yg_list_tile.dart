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
  })  : assert(leadingWidgets.length <= 2, 'Cannot have more than 2 leading widgets.'),
        assert(trailingWidgets.length <= 2, 'Cannot have more than 2 trailing widget.'),
        assert(supportingWidgets.length <= 2, 'Cannot have more than 2 supporting widgets.');

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
                  ],
                ),
              ),
              if (supportingWidgets.isNotEmpty) _buildSupportingWidgets(theme),
              if (trailingWidgets.isNotEmpty) _buildTrailingWidgets(theme),
            ],
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
    return Padding(
      padding: EdgeInsets.only(top: listTileTheme.contentSpacing),
      child: Row(
        children: <Widget>[
          if (subtitleIcon != null)
            Padding(
              padding: EdgeInsets.only(right: listTileTheme.contentSpacing),
              child: subtitleIcon,
            ),
          Flexible(
            child: Text(
              subtitle!,
              style: listTileTheme.subtitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  // TODO(bjhandeland): Make sure the whole button is clickable.
  Widget _buildInfoButton(YgListTileTheme listTileTheme) {
    return Padding(
      padding: EdgeInsets.only(left: listTileTheme.contentSpacing),
      child: YgIcon(
        YgIcons.info,
        size: YgIconSize.small,
        tapSize: YgIconTapSize.largest,
        onTap: onInfoTap,
      ),
    );
  }

  Widget _buildLeadingWidgets(YgListTileTheme listTileTheme) {
    final List<Widget> paddedLeadingIcons = leadingWidgets.map((Widget leadingWidget) {
      return Padding(
        padding: EdgeInsets.only(right: listTileTheme.contentSpacing),
        child: leadingWidget,
      );
    }).toList();

    return Row(children: paddedLeadingIcons);
  }

  Widget _buildTrailingWidgets(YgListTileTheme listTileTheme) {
    final List<Widget> paddedTrailingWidgets = trailingWidgets.map((Widget trailingIcon) {
      return Padding(
        padding: EdgeInsets.only(left: listTileTheme.contentSpacing),
        child: trailingIcon,
      );
    }).toList();

    return Row(children: paddedTrailingWidgets);
  }

  Widget _buildSupportingWidgets(YgListTileTheme listTileTheme) {
    if (supportingWidgets.length == 1) {
      return Padding(
        padding: EdgeInsets.only(left: listTileTheme.contentSpacing),
        child: supportingWidgets.first,
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: listTileTheme.contentSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          supportingWidgets.first,
          SizedBox(height: listTileTheme.contentSpacing),
          supportingWidgets.last,
        ],
      ),
    );
  }

  /// Add a one pixel border in between each tile.
  ///
  /// Modified version of the [divideTiles] method from [ListTile] in M3.
  static Iterable<Widget> divideTiles({
    required Iterable<Widget> tiles,
    required BuildContext context,
  }) {
    tiles = tiles.toList();

    if (tiles.isEmpty || tiles.length == 1) {
      return tiles;
    }

    Widget wrapTile(Widget tile) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.tokens.colors.borderDefault,
              width: 1.0,
            ),
          ),
        ),
        child: tile,
      );
    }

    return <Widget>[
      ...tiles.take(tiles.length - 1).map(wrapTile),
      tiles.last,
    ];
  }
}
