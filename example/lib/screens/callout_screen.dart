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
    return YgScreen(
      componentName: 'Callout',
      componentDesc: 'Callouts',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgCallout(
            calloutVariant: YgCalloutVariant.highlight,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              icon: const Icon(Icons.link),
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.highlight,
            onClose: () {},
            title: 'Title',
            description: 'Callout with a title and description.',
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.highlight,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            calloutVariant: YgCalloutVariant.highlight,
            description: 'Callout with a description only.',
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.success,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              icon: const Icon(Icons.link),
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.success,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.success,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          const YgCallout(
            calloutVariant: YgCalloutVariant.success,
            description: 'Callout with a description only.',
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.warning,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              icon: const Icon(Icons.link),
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.warning,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.warning,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.critical,
            title: 'Title',
            description: 'Callout with a title, description and a text link.',
            textLink: YgTextLink(
              text: 'Link',
              icon: const Icon(Icons.link),
              onPressed: () {},
            ),
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.critical,
            title: 'Title',
            description: 'Callout with a title and description.',
            onClose: () {},
          ),
          YgCallout(
            calloutVariant: YgCalloutVariant.critical,
            description: 'Callout with a description only.',
            onClose: () {},
          ),
        ],
      ),
    );
  }
}
