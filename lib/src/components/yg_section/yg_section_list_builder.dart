part of 'yg_section.dart';

class _YgSectionListBuilder extends YgSection {
  const _YgSectionListBuilder({
    required this.child,
    String? title,
    String? subtitle,
  }) : super._(
          subtitle: subtitle,
          title: title,
        );

  final ListView child;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sectionTheme.padding.bottom),
      child: child,
    );
  }
}
