part of 'yg_expanding_section.dart';

class _YgExpandingSectionRegular extends YgExpandingSection {
  const _YgExpandingSectionRegular({
    required super.title,
    required this.child,
    super.controller,
    super.onExpandedChanged,
    super.initiallyExpanded,
    super.subtitle,
    super.tag,
    super.key,
    super.icon,
  }) : super._();

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
