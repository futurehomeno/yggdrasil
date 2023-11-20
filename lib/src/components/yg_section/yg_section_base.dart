part of 'yg_section.dart';

class _YgSectionBase extends YgSection {
  const _YgSectionBase({
    required this.child,
    super.title,
    super.subtitle,
  }) : super._();

  final Widget child;

  @override
  Widget buildChild(BuildContext context) {
    return _YgSectionPadding(
      child: child,
    );
  }
}
