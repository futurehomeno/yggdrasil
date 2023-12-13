part of '../yg_list_tile.dart';

/// Expanding list tile component.
///
/// This component is used in lists when certain content needs to be hidden
/// until the user expands the widget.
///
/// Supports 2 leading and 2 supporting widgets, however, this differs from
/// design in Figma. This is so we do not encourage designers to use more than
/// 2 widgets.
final class YgExpandingListTile extends YgListTile {
  const YgExpandingListTile({
    super.key,
    required super.title,
    required this.child,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidgets,
    this.supportingWidgets,
    this.onInfoTap,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
  }) : super._(
          disabled: false,
        );

  /// The widget rendered below the list tile when it is expanded..
  final Widget child;

  /// Widgets which will be placed at the front of the list tile.
  final List<Widget>? leadingWidgets;

  /// Up to 2 widgets which will be placed between the content and the trailing widget.
  ///
  /// Will be stacked on top of each other when there is more than one specified.
  final List<Widget>? supportingWidgets;

  /// When provided, shows an info button next to the title.
  ///
  /// Called when the button is pressed.
  final VoidCallback? onInfoTap;

  /// See [YgExpander.controller].
  final YgExpansionController? controller;

  /// See [YgExpander.initiallyExpanded].
  final bool initiallyExpanded;

  /// See [YgExpander.onExpandedChanged].
  final ValueChanged<bool>? onExpandedChanged;

  @override
  Widget build(BuildContext context) {
    final YgListTileTheme theme = context.listTileTheme;

    return YgExpander(
      duration: theme.animationDuration,
      curve: theme.animationCurve,
      headerBuilder: (BuildContext context, YgExpansionController controller) {
        return YgListTileBody(
          title: title,
          subtitle: subtitle,
          subtitleIcon: subtitleIcon,
          disabled: false,
          onTap: controller.toggle,
          infoButton: YgListTileHelpers.buildInfoButton(onInfoTap),
          leading: YgListTileHelpers.buildLeading(theme, leadingWidgets),
          supporting: YgListTileHelpers.buildSupporting(theme, supportingWidgets),
          trailing: ListenableBuilder(
            listenable: controller,
            builder: (BuildContext context, Widget? child) {
              return AnimatedRotation(
                turns: controller.expanded ? 0.5 : 0,
                duration: theme.animationDuration,
                curve: theme.animationCurve,
                child: child,
              );
            },
            child: const YgIcon(
              YgIcons.caretDown,
            ),
          ),
        );
      },
      controller: controller,
      initiallyExpanded: initiallyExpanded,
      onExpandedChanged: onExpandedChanged,
      child: Padding(
        padding: theme.outerPadding.copyWith(
          top: 0,
        ),
        child: child,
      ),
    );
  }
}
