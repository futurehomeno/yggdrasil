import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgListTileBody extends StatelessWidget {
  const YgListTileBody({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.leading,
    required this.trailing,
    required this.supporting,
    required this.infoButton,
    required this.disabled,
    required this.onTap,
  });

  const YgListTileBody.withChildAndOptionalLeading({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    required this.supporting,
    required this.infoButton,
    required this.disabled,
    required this.onTap,
    required Widget child,
    required Widget? leading,
  })  : leading = leading ?? child,
        trailing = leading == null ? null : child;

  final String title;
  final String? subtitle;
  final Widget? subtitleIcon;
  final Widget? leading;
  final Widget? trailing;
  final Widget? supporting;
  final Widget? infoButton;
  final bool disabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgListTileTheme theme = context.listTileTheme;
    final Widget? leading = this.leading;
    final Widget? trailing = this.trailing;
    final Widget? supporting = this.supporting;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: disabled ? null : onTap,
        child: Padding(
          padding: theme.outerPadding,
          child: Row(
            children: <Widget>[
              if (leading != null) leading,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildTitle(theme),
                    if (subtitle != null) _buildSubtitle(theme),
                  ].withVerticalSpacing(theme.titleSubtitleSpacing),
                ),
              ),
              if (supporting != null) supporting,
              if (trailing != null) trailing,
            ].withHorizontalSpacing(theme.contentSpacing),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(YgListTileTheme theme) {
    final Widget? infoButton = this.infoButton;

    return Row(
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: theme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (infoButton != null) infoButton,
      ].withHorizontalSpacing(theme.titleInfoSpacing),
    );
  }

  Widget _buildSubtitle(YgListTileTheme theme) {
    return Row(
      children: <Widget>[
        if (subtitleIcon != null) subtitleIcon!,
        Flexible(
          child: Text(
            subtitle!,
            style: theme.subtitleTextStyle,
          ),
        ),
      ].withHorizontalSpacing(theme.subtitleSubtitleIconSpacing),
    );
  }
}
