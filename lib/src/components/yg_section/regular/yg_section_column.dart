part of '../yg_section.dart';

class _YgSectionColumn extends _YgSectionBase {
  const _YgSectionColumn({
    required this.children,
    super.title,
    super.subtitle,
    super.tag,
  });

  /// The widgets below this widget in the tree.
  final List<Widget> children;

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
