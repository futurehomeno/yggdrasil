import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  static const String routeName = 'ProgressIndicatorScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ProgressIndicatorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ProgressIndicator',
      child: Column(
        children: <Widget>[
          const YgSection(
            title: 'Linear progress indicator',
            child: YgLinearProgressIndicator(),
          ),
          YgSection.column(
            title: 'w/ various values',
            subtitle: 'Spacing between progress indicators added manually.',
            children: <Widget>[
              const YgLinearProgressIndicator(value: 0.25),
              const YgLinearProgressIndicator(value: 0.5),
              const YgLinearProgressIndicator(value: 0.75),
              const YgLinearProgressIndicator(value: 1.0),
            ].withVerticalSpacing(5.0),
          ),
          const YgSection(
            title: 'Circular progress indicator',
            child: YgCircularProgressIndicator(),
          ),
          YgSection(
            title: 'w/ various values',
            subtitle: 'Spacing between progress indicators added manually.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const YgCircularProgressIndicator(value: 0.25),
                const YgCircularProgressIndicator(value: 0.5),
                const YgCircularProgressIndicator(value: 0.75),
                const YgCircularProgressIndicator(value: 1.0),
              ].withHorizontalSpacing(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
