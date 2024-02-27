import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_section/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_expanding_section_column.dart';
part 'yg_expanding_section_list.dart';
part 'yg_expanding_section_regular.dart';

abstract class YgExpandingSection extends StatelessWidget {
  /// A section that can be expanded with a single child.
  const factory YgExpandingSection({
    required Widget child,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgColorableIconData? icon,
    ValueChanged<bool>? onExpandedChanged,
  }) = _YgExpandingSectionRegular;

  /// A section that can be expanded with a column of children.
  const factory YgExpandingSection.column({
    required List<Widget> children,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgColorableIconData? icon,
    ValueChanged<bool>? onExpandedChanged,
  }) = _YgExpandingSectionColumn;

  /// A section that can be expanded with a list of [YgListTile] widgets.
  ///
  /// Unlike the other constructors does not apply padding to its children as
  /// list tiles are responsible for providing their own padding and should
  /// reach to the edges of the screen.
  const factory YgExpandingSection.list({
    required List<YgListTile> children,
    required String title,
    YgExpansionController? controller,
    bool initiallyExpanded,
    Key? key,
    String? subtitle,
    YgTag? tag,
    YgColorableIconData? icon,
    ValueChanged<bool>? onExpandedChanged,
  }) = _YgExpandingSectionList;

  const YgExpandingSection._({
    super.key,
    required this.title,
    this.subtitle,
    this.tag,
    this.icon,
    this.controller,
    this.onExpandedChanged,
    this.initiallyExpanded = false,
  });

  /// Title of the section.
  final String title;

  /// Subtitle of the section.
  ///
  /// You cannot have a subtitle without a title.
  final String? subtitle;

  /// The tag trailing the section.
  ///
  /// You cannot have a tag without a title.
  final YgTag? tag;

  /// The icon leading the section.
  ///
  /// You cannot have an icon without a title.
  final YgColorableIconData? icon;

  /// See [YgExpander.controller].
  final YgExpansionController? controller;

  /// See [YgExpander.initiallyExpanded].
  final bool initiallyExpanded;

  /// See [YgExpander.onExpandedChanged].
  final ValueChanged<bool>? onExpandedChanged;

  @override
  Widget build(BuildContext context) {
    final YgSectionTheme theme = context.sectionTheme;
    final YgTag? tag = this.tag;

    return YgExpander(
      duration: theme.animationDuration,
      curve: theme.animationCurve,
      headerBuilder: (BuildContext context, YgExpansionController controller) {
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: controller.toggle,
            child: YgSectionHeaderInternal(
              title: title,
              subtitle: subtitle,
              icon: icon,
              tag: tag,
              trailing: _buildExpandButton(theme, controller),
            ),
          ),
        );
      },
      controller: controller,
      initiallyExpanded: initiallyExpanded,
      onExpandedChanged: onExpandedChanged,
      child: buildChild(context),
    );
  }

  Widget _buildExpandButton(YgSectionTheme theme, YgExpansionController controller) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, Widget? child) => AnimatedRotation(
        turns: controller.expanded ? 0.5 : 0,
        duration: theme.animationDuration,
        curve: theme.animationCurve,
        child: child,
      ),
      child: const YgIcon(
        YgIcons.caretDown,
      ),
    );
  }

  /// Builds the child widget.
  Widget buildChild(BuildContext context);
}
