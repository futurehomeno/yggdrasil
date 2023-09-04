part of 'yg_section.dart';

class _YgSectionPadding extends StatelessWidget {
  const _YgSectionPadding({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.sectionTheme.padding,
      child: child,
    );
  }
}
