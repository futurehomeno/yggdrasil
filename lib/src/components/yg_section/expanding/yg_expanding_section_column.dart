part of '../yg_section.dart';

class _YgExpandingSectionColumn extends _YgExpandingSectionBase {
  const _YgExpandingSectionColumn({
    required super.title,
    required this.children,
    super.controller,
    super.initiallyExpanded,
    super.onExpandedChanged,
    super.subtitle,
    super.tag,
    super.key,
    super.icon,
  });

  /// The widgets below this widget in the tree.
  final List<YgListTile> children;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
