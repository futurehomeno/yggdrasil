part of 'yg_section.dart';

class _YgSectionBase extends YgSection {
  const _YgSectionBase({
    required this.child,
    String? title,
    String? subtitle,
  }) : super._(
          subtitle: subtitle,
          title: title,
        );

  final Widget child;

  @override
  Widget buildChild(BuildContext context) {
    return _YgSectionPadding(
      child: child,
    );
  }
}
