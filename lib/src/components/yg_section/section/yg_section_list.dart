part of 'yg_section.dart';

class _YgSectionList extends YgSection {
  const _YgSectionList({
    required this.children,
    super.title,
    super.subtitle,
    super.tag,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
