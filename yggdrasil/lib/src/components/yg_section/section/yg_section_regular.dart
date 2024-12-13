part of 'yg_section.dart';

class _YgSectionRegular extends YgSection {
  const _YgSectionRegular({
    super.key,
    required this.child,
    super.title,
    super.subtitle,
    super.trailing,
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
