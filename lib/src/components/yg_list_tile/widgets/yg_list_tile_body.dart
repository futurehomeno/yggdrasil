import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Internal widget used in [YgListTile] variants.
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
  })  : assert(
          title != null || subtitle == null,
          'Can not have a subtitle without a title.',
        ),
        assert(
          title != null || subtitle == null,
          'Can not have a infoButton without a title.',
        ),
        assert(
          title != null || leading != null,
          'Can not have neither a title or leading widget.',
        );

  factory YgListTileBody.withChildAndOptionalLeading({
    Key? key,
    required String? title,
    required String? subtitle,
    required Widget? subtitleIcon,
    required Widget? supporting,
    required Widget? infoButton,
    required bool disabled,
    required VoidCallback? onTap,
    required Widget child,
    required Widget? leading,
  }) {
    assert(
      title != null || leading != null,
      'Can not have neither a title or leading widget.',
    );

    final ({
      Widget? leading,
      Widget? trailing,
    }) result = _getLeadingTrailing(
      child,
      leading,
      title != null,
    );

    return YgListTileBody(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      supporting: supporting,
      infoButton: infoButton,
      disabled: disabled,
      onTap: onTap,
      leading: result.leading,
      trailing: result.trailing,
    );
  }

  static ({
    Widget? leading,
    Widget? trailing,
  }) _getLeadingTrailing(Widget child, Widget? leading, bool hasTitle) {
    if (leading != null) {
      if (hasTitle) {
        return (
          leading: leading,
          trailing: child,
        );
      }

      return (
        leading: Builder(
          builder: (BuildContext context) {
            final YgListTileTheme theme = context.listTileTheme;

            return Row(
              children: <Widget>[
                child,
                leading,
              ].withHorizontalSpacing(theme.contentSpacing),
            );
          },
        ),
        trailing: null,
      );
    }

    return (
      leading: child,
      trailing: null,
    );
  }

  /// The title of the list tile.
  final String? title;

  /// The subtitle of the list tile.
  final String? subtitle;

  /// The icon shown in from of the subtitle.
  final Widget? subtitleIcon;

  /// The leading widget.
  final Widget? leading;

  /// The trailing widget.
  final Widget? trailing;

  /// The supporting widget.
  final Widget? supporting;

  /// The button shown directly behind the title.
  final Widget? infoButton;

  /// Whether to respond to touch input.
  final bool disabled;

  /// Called when the widget was tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final YgListTileTheme theme = context.listTileTheme;
    final Widget? trailing = this.trailing;
    final Widget? supporting = this.supporting;
    final Widget? leading = this.leading;
    final Widget? title = _buildTitleSubtitle(theme);

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: disabled ? null : onTap,
        child: Padding(
          padding: theme.outerPadding,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    if (leading != null) leading,
                    if (title != null)
                      Expanded(
                        child: title,
                      ),
                  ].withHorizontalSpacing(theme.contentSpacing),
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

  Widget? _buildTitleSubtitle(YgListTileTheme theme) {
    final Widget? title = _buildTitle(theme);
    final Widget? subtitle = _buildSubtitle(theme);

    if (title == null) {
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        if (subtitle != null) subtitle,
      ].withVerticalSpacing(theme.titleSubtitleSpacing),
    );
  }

  Widget? _buildTitle(YgListTileTheme theme) {
    final Widget? infoButton = this.infoButton;
    final String? title = this.title;

    if (title == null) {
      return null;
    }

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

  Widget? _buildSubtitle(YgListTileTheme theme) {
    final String? subtitle = this.subtitle;
    final Widget? subtitleIcon = this.subtitleIcon;

    if (subtitle == null) {
      return null;
    }

    return Row(
      children: <Widget>[
        if (subtitleIcon != null) subtitleIcon,
        Flexible(
          child: Text(
            subtitle,
            style: theme.subtitleTextStyle,
          ),
        ),
      ].withHorizontalSpacing(theme.subtitleSubtitleIconSpacing),
    );
  }
}
