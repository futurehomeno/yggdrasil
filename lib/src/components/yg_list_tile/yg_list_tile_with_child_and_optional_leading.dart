part of 'yg_list_tile.dart';

/// A [YgListTile] that renders its child as a leading widget, unless
/// [leadingWidget] is specified by the user, in which case it renders as a
/// trailing widget.
abstract class _YgListTileWithChildAndOptionalLeading extends YgListTile {
  const _YgListTileWithChildAndOptionalLeading({
    super.key,
    required super.title,
    super.subtitle,
    super.subtitleIcon,
    super.disabled = false,
    this.leadingWidget,
  }) : super._();

  /// Optional widget which will be placed at the front of the list tile.
  final Widget? leadingWidget;

  @override
  Widget _buildLeadingWidgets(BuildContext context) {
    final Widget? leadingWidget = this.leadingWidget;

    if (leadingWidget == null) {
      return _buildChild(context);
    }

    return leadingWidget;
  }

  @override
  Widget? _buildTrailingWidgets(BuildContext context) {
    final Widget? leadingWidget = this.leadingWidget;

    if (leadingWidget == null) {
      return null;
    }

    return _buildChild(context);
  }

  Widget _buildChild(BuildContext context);
}
