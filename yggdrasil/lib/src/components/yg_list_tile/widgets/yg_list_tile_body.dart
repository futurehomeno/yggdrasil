import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef WrapperBuilder = Widget Function(BuildContext context, Widget child);

/// Internal widget used in [YgListTile] variants.
class YgListTileBody extends StatefulWidget {
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
    required this.density,
    required this.builder,
  })  : assert(
          title != null || infoButton == null,
          'Can not have a infoButton without a title.',
        ),
        assert(
          title != null || leading != null || subtitle != null,
          'Can not have neither a title, subtitle or leading widget.',
        );

  factory YgListTileBody.withChildAndOptionalLeading({
    Key? key,
    required YgListTileDensity density,
    required bool disabled,
    required Widget child,
    required Widget? title,
    required Widget? subtitle,
    required Widget? subtitleIcon,
    required Widget? supporting,
    required Widget? infoButton,
    required Widget? leading,
    required WrapperBuilder? builder,
    required VoidCallback? onTap,
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
      density: density,
      builder: builder,
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
  final Widget? title;

  /// The subtitle of the list tile.
  final Widget? subtitle;

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

  /// The density of the list tile.
  final YgListTileDensity density;

  /// Builder which can wrap the content of the list tile in another widget.
  final WrapperBuilder? builder;

  @override
  State<YgListTileBody> createState() => _YgListTileBodyState();
}

class _YgListTileBodyState extends StateWithYgStateAndStyle<YgListTileBody, YgListTileBodyState, YgListTileBodyStyle> {
  final GlobalKey<State<StatefulWidget>> _contentKey = GlobalKey();

  @override
  YgListTileBodyState createState() {
    return YgListTileBodyState(
      variant: widget.density,
    );
  }

  @override
  YgListTileBodyStyle createStyle() {
    return YgListTileBodyStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.density;
  }

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onTap = widget.disabled ? null : widget.onTap;

    final Material content = Material(
      key: _contentKey,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: YgAnimatedPadding(
          padding: style.outerPadding,
          child: _buildContent(),
        ),
      ),
    );

    if (onTap != null) {
      return RepaintBoundary(
        child: content,
      );
    }

    return content;
  }

  Widget _buildContent() {
    final YgListTileTheme theme = context.listTileTheme;
    final Widget? trailing = widget.trailing;
    final Widget? supporting = widget.supporting;
    final Widget? leading = widget.leading;
    final Widget? title = _buildTitleSubtitle(theme);
    final WrapperBuilder? builder = widget.builder;

    final Row content = Row(
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
    );

    if (builder != null) {
      return builder(context, content);
    }

    return content;
  }

  Widget? _buildTitleSubtitle(YgListTileTheme theme) {
    final Widget? title = _buildTitle(theme);
    final Widget? subtitle = _buildSubtitle(theme);

    // return the subtitle, title, both in a column or null.

    if (title == null) {
      return subtitle;
    }

    if (subtitle == null) {
      return title;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        subtitle,
      ].withVerticalSpacing(theme.titleSubtitleSpacing),
    );
  }

  Widget? _buildTitle(YgListTileTheme theme) {
    final Widget? infoButton = widget.infoButton;
    final Widget? title = widget.title;

    if (title == null) {
      return null;
    }

    return Row(
      children: <Widget>[
        Flexible(
          child: DefaultTextStyle(
            style: theme.titleTextStyle,
            overflow: TextOverflow.ellipsis,
            child: title,
          ),
        ),
        if (infoButton != null) infoButton,
      ].withHorizontalSpacing(theme.titleInfoSpacing),
    );
  }

  Widget? _buildSubtitle(YgListTileTheme theme) {
    final Widget? subtitle = widget.subtitle;
    final Widget? subtitleIcon = widget.subtitleIcon;

    if (subtitle == null) {
      return null;
    }

    return Row(
      children: <Widget>[
        if (subtitleIcon != null) subtitleIcon,
        Flexible(
          child: DefaultTextStyle(
            style: theme.subtitleTextStyle,
            child: subtitle,
          ),
        ),
      ].withHorizontalSpacing(theme.subtitleSubtitleIconSpacing),
    );
  }
}
