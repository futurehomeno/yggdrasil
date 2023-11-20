part of 'yg_list_tile.dart';

class _YgListTileBody extends StatelessWidget {
  const _YgListTileBody({
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

  const _YgListTileBody.withChildAndOptionalLeading({
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

  static Widget? _buildInfoButton(VoidCallback? onInfoTap) {
    if (onInfoTap == null) {
      return null;
    }

    return YgIconButton(
      onPressed: onInfoTap,
      size: YgIconButtonSize.small,
      child: const YgIcon(YgIcons.info),
    );
  }

  static Widget? _buildLeading(
    YgListTileTheme theme,
    List<Widget>? leadingWidgets,
  ) {
    if (leadingWidgets == null || leadingWidgets.isEmpty) {
      return null;
    }

    assert(
      leadingWidgets.length <= YgListTile._allowedNumberOfLeadingWidgets,
      'Cannot have more than 2 leading widgets.',
    );

    return Row(
      children: leadingWidgets.withHorizontalSpacing(
        theme.contentSpacing,
      ),
    );
  }

  static Widget? _buildTrailing(
    YgListTileTheme theme,
    List<Widget>? trailingWidgets,
  ) {
    if (trailingWidgets == null || trailingWidgets.isEmpty) {
      return null;
    }

    assert(
      trailingWidgets.length <= YgListTile._allowedNumberOfTrailingWidgets,
      'Cannot have more than 2 trailing widget.',
    );

    return Row(
      children: trailingWidgets.withHorizontalSpacing(
        theme.contentSpacing,
      ),
    );
  }

  static Widget? _buildSupporting(
    YgListTileTheme theme,
    List<Widget>? supportingWidgets,
  ) {
    if (supportingWidgets == null || supportingWidgets.isEmpty) {
      return null;
    }

    assert(
      supportingWidgets.length <= YgListTile._allowedNumberOfSupportingWidgets,
      'Cannot have more than 2 supporting widgets.',
    );

    return Column(
      children: supportingWidgets.withVerticalSpacing(
        theme.contentSpacing,
      ),
    );
  }

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
