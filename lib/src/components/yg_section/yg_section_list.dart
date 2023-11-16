part of 'yg_section.dart';

class _YgSectionList extends YgSection {
  const _YgSectionList({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
    String? title,
    String? subtitle,
  }) : super._(
          subtitle: subtitle,
          title: title,
        );

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final List<YgListTile> children;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sectionTheme.padding.bottom),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
