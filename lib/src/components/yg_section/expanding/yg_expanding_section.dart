part of '../yg_section.dart';

class _YgExpandingSection extends _YgExpandingSectionBase {
  const _YgExpandingSection({
    required super.title,
    required this.child,
    super.controller,
    super.onExpandedChanged,
    super.initiallyExpanded,
    super.subtitle,
    super.tag,
    super.key,
    super.icon,
  });

  final Widget child;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: child,
    );
  }
}
