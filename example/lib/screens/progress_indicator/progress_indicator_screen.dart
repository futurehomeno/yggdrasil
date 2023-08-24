import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({super.key});

  static const String routeName = 'ProgressIndicatorScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ProgressIndicatorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ProgressIndicator',
      componentDesc: 'ProgressIndicators',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Linear progress indicator',
            children: <Widget>[
              const YgLinearProgressIndicator(),
            ],
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
          YgSection.column(
            title: 'Circular progress indicator',
            children: <Widget>[
              const YgCircularProgressIndicator(),
            ],
          ),
          YgSection.column(
            title: 'w/ various values',
            subtitle: 'Spacing between progress indicators added manually.',
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const YgCircularProgressIndicator(value: 0.25),
                  const YgCircularProgressIndicator(value: 0.5),
                  const YgCircularProgressIndicator(value: 0.75),
                  const YgCircularProgressIndicator(value: 1.0),
                ].withHorizontalSpacing(5.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
