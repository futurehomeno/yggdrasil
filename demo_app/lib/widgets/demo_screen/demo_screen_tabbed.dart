part of 'demo_screen.dart';

class _DemoScreenTabbed extends DemoScreen {
  const _DemoScreenTabbed({
    super.key,
    required this.tabs,
    super.appBar,
    super.componentName,
    super.headerBehavior,
  }) : super._();

  final List<YgLayoutTab> tabs;

  @override
  Widget _buildLayout(BuildContext context, Widget appBar) {
    return YgLayout.tabbed(
      headerBehavior: headerBehavior,
      appBar: appBar,
      tabs: tabs,
    );
  }
}
