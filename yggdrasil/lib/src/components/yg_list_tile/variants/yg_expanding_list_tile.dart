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
    required this.child,
    super.title,
    super.subtitle,
    super.subtitleIcon,
    this.leadingWidgets,
    this.supportingWidgets,
    this.onInfoTap,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
    super.density = YgListTileDensity.standard,
  })  : assert(
          title != null || leadingWidgets != null,
          'Can not have neither a title or leading widget.',
        ),
        assert(
          subtitleIcon == null || subtitle != null,
          'Can not add a subtitleIcon without a subtitle.',
        ),
        assert(
          title != null || subtitle == null,
          'Can not have a subtitle without a title.',
        ),
        assert(
          title != null || onInfoTap == null,
          'Can not have a infoButton without a title.',
        ),
        super._(
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

    assert(
      title != null || leadingWidgets?.isNotEmpty == true,
      'Can not have neither a title or leading widget.',
    );

    // This is slightly convoluted, the reason for this is that the expander has
    // to be inside the list tile because the list tile manages the outer padding
    // animation, while the list tile
    return YgExpanderDefaultController(
      controller: controller,
      initiallyExpanded: initiallyExpanded,
      onExpandedChanged: onExpandedChanged,
      child: Builder(
        builder: (BuildContext context) {
          final YgExpansionController controller = YgExpansionController.of(context);

          return YgListTileBody(
            density: density,
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
              builder: (BuildContext context, Widget? child) => AnimatedRotation(
                turns: controller.expanded ? 0.5 : 0,
                duration: theme.animationDuration,
                curve: theme.animationCurve,
                child: child,
              ),
              child: const YgIcon(
                YgIcons.caretDown,
              ),
            ),
            builder: (BuildContext context, Widget body) {
              return YgExpander(
                headerBuilder: (__, _) => body,
                duration: theme.animationDuration,
                curve: theme.animationCurve,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: theme.contentSpacing,
                  ),
                  child: child,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
