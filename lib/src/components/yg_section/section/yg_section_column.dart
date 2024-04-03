part of 'yg_section.dart';

class _YgSectionColumn extends YgSection {
  const _YgSectionColumn({
    required this.children,
    super.title,
    super.subtitle,
    super.tag,
    super.icon,
  }) : super._();

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
