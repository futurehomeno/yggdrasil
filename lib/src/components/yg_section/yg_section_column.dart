part of 'yg_section.dart';

class _YgSectionColumn extends YgSection {
  const _YgSectionColumn({
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
  final List<Widget> children;

  @override
  Widget buildChild(BuildContext context) {
    return _YgSectionPadding(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
