import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_icon/yg_icon.dart';
import 'package:yggdrasil/src/components/yg_list_tile/enums/yg_list_tile_density.dart';
import 'package:yggdrasil/src/components/yg_list_tile/helpers/yg_list_tile_helpers.dart';
import 'package:yggdrasil/src/components/yg_list_tile/widgets/yg_list_tile_body.dart';
import 'package:yggdrasil/src/extensions/_extensions.dart';
import 'package:yggdrasil/src/generated/icons/_icons.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/src/utils/yg_expander/yg_expander_default_controller.dart';

/// Expanding list tile component.
///
/// This component is used in lists when certain content needs to be hidden
/// until the user expands the widget.
///
/// Supports 2 leading and 2 supporting widgets, however, this differs from
/// design in Figma. This is so we do not encourage designers to use more than
/// 2 widgets.
final class YgExpandingListTile extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgExpandingListTile({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidgets,
    this.supportingWidgets,
    this.onInfoTap,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
    this.density = YgListTileDensity.standard,
  })  : assert(
          title != null || leadingWidgets != null || subtitle != null,
          'Can not have neither a title, subtitle, or leading widget.',
        ),
        assert(
          subtitleIcon == null || subtitle != null,
          'Can not add a subtitleIcon without a subtitle.',
        ),
        assert(
          title != null || onInfoTap == null,
          'Can not have a infoButton without a title.',
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

  /// The title.
  ///
  /// Shown in the middle of the list tile when there is no [subtitle], will be
  /// pushed to the top of the list tile if there is a [subtitle].
  final String? title;

  /// The subtitle.
  ///
  /// Shown below the [title].
  final String? subtitle;

  /// Small icon shown in front of [subtitle].
  ///
  /// Can not be provided when there is no subtitle.
  final Widget? subtitleIcon;

  /// The density of the list tile.
  ///
  /// Defaults to [YgListTileDensity.standard].
  final YgListTileDensity density;

  @override
  Widget build(BuildContext context) {
    final YgListTileTheme theme = context.listTileTheme;

    return YgExpanderDefaultController(
      controller: controller,
      initiallyExpanded: initiallyExpanded,
      onExpandedChanged: onExpandedChanged,
      child: Builder(
        builder: (BuildContext context) {
          final YgExpansionController controller = YgExpansionController.of(context);

          return YgListTileBody(
            density: density,
            title: title.safeBuild(
              (String text) => Text(text),
            ),
            subtitle: subtitle.safeBuild(
              (String text) => Text(text),
            ),
            subtitleIcon: subtitleIcon,
            disabled: false,
            onTap: controller.toggle,
            infoButton: YgListTileHelpers.buildInfoButton(onInfoTap),
            leading: YgListTileHelpers.buildLeading(theme, leadingWidgets),
            supporting: YgListTileHelpers.buildSupporting(theme, supportingWidgets),
            trailing: ListenableBuilder(
              listenable: controller,
              builder: (BuildContext _, Widget? child) => AnimatedRotation(
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
                headerBuilder: (BuildContext _, YgExpansionController __) => body,
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

  @override
  YgDebugType get debugType => YgDebugType.intractable;
}
