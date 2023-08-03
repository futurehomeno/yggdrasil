import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class CalloutScreen extends StatelessWidget {
  const CalloutScreen({super.key});

  static const String routeName = 'CalloutScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const CalloutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Callout',
      componentDesc: 'Callouts',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          const YgListTile(title: 'Highlight callout'),
          YgCallout(
            variant: YgCalloutVariant.highlight,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              external: true,
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.highlight,
            onClose: () {},
            title: 'Title',
            description: 'Callout with a title and description.',
          ),
          YgCallout(
            variant: YgCalloutVariant.highlight,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            variant: YgCalloutVariant.highlight,
            description: 'Callout with no close.',
          ),
          const YgListTile(title: 'Success callout'),
          YgCallout(
            variant: YgCalloutVariant.success,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              external: true,
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.success,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.success,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            variant: YgCalloutVariant.success,
            description: 'Callout with no close.',
          ),
          const YgListTile(title: 'Warning callout'),
          YgCallout(
            variant: YgCalloutVariant.warning,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              external: true,
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.warning,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.warning,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            variant: YgCalloutVariant.warning,
            description: 'Callout with no close.',
          ),
          const YgListTile(title: 'Critical callout'),
          YgCallout(
            variant: YgCalloutVariant.critical,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              external: true,
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.critical,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            variant: YgCalloutVariant.critical,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            variant: YgCalloutVariant.critical,
            description: 'Callout with no close.',
          ),
        ],
      ),
    );
  }
}
