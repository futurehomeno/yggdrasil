part of 'yg_section.dart';

class _YgSectionColumn extends YgSection {
  const _YgSectionColumn({
    required this.children,
    super.title,
    super.subtitle,
    super.tag,
    super.icon,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super._();

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// The horizontal alignment of the children.
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
