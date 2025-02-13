part of 'demo_screen.dart';

class _DemoScreenRegular extends DemoScreen {
  const _DemoScreenRegular({
    super.key,
    required this.child,
    super.appBar,
    super.bottom,
    super.componentName,
  }) : super._();

  final Widget child;

  @override
  Widget _buildLayout(BuildContext context, Widget appBar) {
    return YgLayout(
      appBar: appBar,
      child: child,
    );
  }
}
