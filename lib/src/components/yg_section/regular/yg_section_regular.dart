part of '../yg_section.dart';

class _YgSectionRegular extends _YgSectionBase {
  const _YgSectionRegular({
    required this.child,
    super.title,
    super.subtitle,
    super.tag,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: child,
    );
  }
}
