part of 'yg_list_tile.dart';

/// List tile component based on [ListTile] from M3.
///
/// This component is used to display a list of items.
///
/// Supports 2 leading, 2 trailing and 2 supporting widgets,
/// however, this differs from design in Figma. This is so
/// we do not encourage designers to use more than 2 widgets.
class _YgRegularListTile extends YgListTile {
  const _YgRegularListTile({
    super.key,
    required super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidgets = const <YgIcon>[],
    this.trailingWidgets = const <YgIcon>[],
    this.supportingWidgets = const <Widget>[],
    this.onTap,
    this.onInfoTap,
  }) : super._(
          disabled: onTap == null,
        );

  static const int _allowedNumberOfLeadingWidgets = 2;
  static const int _allowedNumberOfTrailingWidgets = 2;
  static const int _allowedNumberOfSupportingWidgets = 2;

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

  @override
  Widget? _buildInfoButton(BuildContext context) {
    if (onInfoTap == null) {
      return null;
    }

    return YgIconButton(
      onPressed: onInfoTap,
      size: YgIconButtonSize.small,
      child: const YgIcon(YgIcons.info),
    );
  }

  @override
  Widget? _buildLeadingWidgets(BuildContext context) {
    assert(
      leadingWidgets.length <= _allowedNumberOfLeadingWidgets,
      'Cannot have more than 2 leading widgets.',
    );

    if (leadingWidgets.isEmpty) {
      return null;
    }

    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Row(
      children: leadingWidgets.withHorizontalSpacing(
        listTileTheme.contentSpacing,
      ),
    );
  }

  @override
  Widget? _buildTrailingWidgets(BuildContext context) {
    assert(
      trailingWidgets.length <= _allowedNumberOfTrailingWidgets,
      'Cannot have more than 2 trailing widget.',
    );

    if (trailingWidgets.isEmpty) {
      return null;
    }

    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Row(
      children: trailingWidgets.withHorizontalSpacing(
        listTileTheme.contentSpacing,
      ),
    );
  }

  @override
  Widget? _buildSupportingWidgets(BuildContext context) {
    assert(
      supportingWidgets.length <= _allowedNumberOfSupportingWidgets,
      'Cannot have more than 2 supporting widgets.',
    );

    if (supportingWidgets.isEmpty) {
      return null;
    }

    final YgListTileTheme listTileTheme = context.listTileTheme;

    return Column(
      children: supportingWidgets.withVerticalSpacing(
        listTileTheme.contentSpacing,
      ),
    );
  }

  @override
  void _onTap() {
    onTap?.call();
  }
}
