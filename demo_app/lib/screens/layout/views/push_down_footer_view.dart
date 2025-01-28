import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/demo_placeholder.dart';

class PushDownFooterView extends StatelessWidget {
  const PushDownFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody(
      footerBehavior: YgFooterBehavior.pushDown,
      footer: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.link,
            child: const Text('Previous'),
            onPressed: () {},
          ),
          YgButton(
            child: const Text('Next'),
            onPressed: () {},
          ),
        ],
      ),
      child: const YgSection(
        title: 'YgFooterBehavior.pushDown',
        subtitle: 'Footer sticks to the bottom unless content is taller.\n\n'
            'The footer will be positioned at the bottom of the screen unless the'
            ' main content height exceeds the remaining screen space, in which case'
            ' the footer will be pushed down off the screen.',
        child: DemoPlaceholder(
          height: 200,
        ),
      ),
    );
  }
}
