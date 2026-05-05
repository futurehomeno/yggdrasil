part of 'demo_screen.dart';

class _DemoScreenRegular extends DemoScreen {
  const _DemoScreenRegular({
    super.key,
    required this.child,
    super.appBar,
    super.bottomNavigationBar,
    super.componentName,
    super.headerBehavior,
  }) : super._();

  final Widget child;

  @override
  Widget _buildLayout(BuildContext context, Widget appBar) {
    return YgLayout(
      headerBehavior: headerBehavior,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      child: child,
    );
  }
}
