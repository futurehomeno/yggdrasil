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
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Linear progress indicator'),
              const YgLinearProgressIndicator(),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(
                title: 'w/ various values',
                subtitle: 'Spacing between progress indicators added manually.',
              ),
              const YgLinearProgressIndicator(value: 0.25),
              const YgLinearProgressIndicator(value: 0.5),
              const YgLinearProgressIndicator(value: 0.75),
              const YgLinearProgressIndicator(value: 1.0),
            ].withVerticalSpacing(5.0),
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(title: 'Circular progress indicator'),
              const YgCircularProgressIndicator(),
            ],
          ),
          YgSectionColumn(
            children: <Widget>[
              const YgSectionTile(
                title: 'w/ various values',
                subtitle: 'Spacing between progress indicators added manually.',
              ),
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
