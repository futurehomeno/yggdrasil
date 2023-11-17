import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CalloutScreen extends StatelessWidget {
  const CalloutScreen({super.key});

  static const String routeName = 'CalloutScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CalloutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Callout',
      child: Column(
        children: <Widget>[
          YgSection.column(
            title: 'Variants',
            subtitle: 'Spacing between callouts added manually.',
            children: <Widget>[
              const YgCallout(
                variant: YgCalloutVariant.highlight,
                title: 'Title',
                description: 'Callout with a title and description.',
              ),
              const YgCallout(
                variant: YgCalloutVariant.success,
                title: 'Title',
                description: 'Callout with a title and description.',
              ),
              const YgCallout(
                variant: YgCalloutVariant.warning,
                title: 'Title',
                description: 'Callout with a title and description.',
              ),
              const YgCallout(
                variant: YgCalloutVariant.critical,
                title: 'Title',
                description: 'Callout with a title and description.',
              ),
            ].withVerticalSpacing(10.0),
          ),
          YgSection.base(
            title: 'With close button',
            subtitle:
                'When used with a close button, the information about closing the button needs to be saved somewhere.',
            child: YgCallout(
              variant: YgCalloutVariant.highlight,
              title: 'Title',
              description: 'Callout with a title and description.',
              onClose: () {},
            ),
          ),
          const YgSection.base(
            title: 'Only description',
            child: YgCallout(
              variant: YgCalloutVariant.highlight,
              description: 'Callout with description only',
            ),
          ),
          YgSection.base(
            title: 'With text link button',
            child: YgCallout(
              variant: YgCalloutVariant.highlight,
              title: 'Title',
              description: 'Callout with text link',
              textLink: YgTextLink(
                text: 'Text link',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
