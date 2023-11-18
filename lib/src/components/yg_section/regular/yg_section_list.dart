part of '../yg_section.dart';

class _YgSectionList extends _YgSectionBase {
  const _YgSectionList({
    required this.children,
    super.title,
    super.subtitle,
    super.tag,
  });

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
