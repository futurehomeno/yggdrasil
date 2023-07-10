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
      componentDesc: 'Callout',
      supernovaLink: 'Link',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            YgCallout(
              calloutVariant: YgCalloutVariant.highlight,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              textLink: YgTextLink(
                text: 'Link',
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.highlight,
              onClose: () {},
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.highlight,
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.success,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              textLink: YgTextLink(
                text: 'Link',
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.success,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.success,
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.warning,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              textLink: YgTextLink(
                text: 'Link',
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.warning,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.warning,
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.critical,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              textLink: YgTextLink(
                text: 'Link',
                icon: const Icon(Icons.link),
                onPressed: () {},
              ),
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.critical,
              title: 'Title',
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
            YgCallout(
              calloutVariant: YgCalloutVariant.critical,
              description:
                  'Callouts are contextual messages used to communicate a specific state to a page or feature.',
              onClose: () {},
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
