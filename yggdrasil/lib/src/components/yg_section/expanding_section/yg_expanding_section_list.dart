part of 'yg_expanding_section.dart';

class _YgExpandingSectionList extends YgExpandingSection {
  const _YgExpandingSectionList({
    required super.title,
    required this.children,
    super.controller,
    super.initiallyExpanded,
    super.onExpandedChanged,
    super.subtitle,
    super.tag,
    super.key,
    super.icon,
  }) : super._();

  /// The widgets below this widget in the tree.
  final List<YgListTile> children;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sectionTheme.padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
