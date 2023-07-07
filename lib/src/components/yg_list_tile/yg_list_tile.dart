import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgListTile extends StatelessWidget {
  const YgListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingWidgets = const <Widget>[],
    this.trailingWidgets = const <Widget>[],
    this.supportingWidgets = const <Widget>[],
    this.onTap,
    this.onInfoTap,
  })  : assert(leadingWidgets.length <= 2, 'Cannot have more than 2 leading widgets.'),
        assert(trailingWidgets.length <= 2, 'Cannot have more than 2 trailing widget.'),
        assert(supportingWidgets.length <= 2, 'Cannot have more than 2 supporting widgets.');

  final String title;
  final String? subtitle;
  final List<Widget> leadingWidgets;
  final List<Widget> trailingWidgets;
  final List<Widget> supportingWidgets;
  final VoidCallback? onTap;
  final VoidCallback? onInfoTap;

  @override
  Widget build(BuildContext context) {
    final YgListTileThemes listTileThemes = context.listTileThemes;

    return Material(
      borderRadius: BorderRadius.circular(10.0),
      color: context.tokens.colors.backgroundTransparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onTap,
        child: Padding(
          padding: listTileThemes.padding,
          child: Row(
            children: <Widget>[
              if (leadingWidgets.isNotEmpty) _buildLeadingWidgets(listTileThemes),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(listTileThemes),
                    if (subtitle != null) _buildSubtitle(listTileThemes),
                  ],
                ),
              ),
              if (supportingWidgets.isNotEmpty) _buildSupportingWidgets(listTileThemes),
              if (trailingWidgets.isNotEmpty) _buildTrailingWidgets(listTileThemes),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(YgListTileThemes listTileThemes) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: listTileThemes.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (onInfoTap != null) _buildInfoButton(listTileThemes),
      ],
    );
  }

  Widget _buildSubtitle(YgListTileThemes listTileThemes) {
    return Padding(
      padding: EdgeInsets.only(top: listTileThemes.contentSpacing),
      child: Text(
        subtitle!,
        style: listTileThemes.subtitleTextStyle,
      ),
    );
  }

  Widget _buildInfoButton(YgListTileThemes listTileThemes) {
    return Padding(
      padding: EdgeInsets.only(left: listTileThemes.contentSpacing),
      child: YgIcon(
        icon: 'Icon',
        iconSize: YgIconSize.small,
        tapSize: YgIconTapSize.large,
        onTap: onInfoTap!,
      ),
    );
  }

  Widget _buildLeadingWidgets(YgListTileThemes listTileThemes) {
    final List<Widget> paddedLeadingIcons = leadingWidgets.map((Widget leadingWidget) {
      return Padding(
        padding: EdgeInsets.only(right: listTileThemes.contentSpacing),
        child: leadingWidget,
      );
    }).toList();

    return Row(children: paddedLeadingIcons);
  }

  Widget _buildTrailingWidgets(YgListTileThemes listTileThemes) {
    final List<Widget> paddedTrailingWidgets = trailingWidgets.map((Widget trailingIcon) {
      return Padding(
        padding: EdgeInsets.only(left: listTileThemes.contentSpacing),
        child: trailingIcon,
      );
    }).toList();

    return Row(children: paddedTrailingWidgets);
  }

  Widget _buildSupportingWidgets(YgListTileThemes listTileThemes) {
    if (supportingWidgets.length == 1) {
      return Padding(
        padding: EdgeInsets.only(left: listTileThemes.contentSpacing),
        child: supportingWidgets.first,
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: listTileThemes.contentSpacing),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        supportingWidgets.first,
        SizedBox(height: listTileThemes.contentSpacing),
        supportingWidgets.last,
      ]),
    );
  }
}
