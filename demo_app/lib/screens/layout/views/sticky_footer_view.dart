import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class StickyFooterView extends StatelessWidget {
  const StickyFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return YgLayoutBody(
      footerBehavior: YgFooterBehavior.sticky,
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
        title: 'YgFooterBehavior.sticky',
        subtitle: 'Footer sticks to the bottom of the screen.\n\n'
            'The footer will always be positioned at the bottom of the screen,'
            ' regardless of the content height.',
        child: DemoPlaceholder(
          height: 2000,
        ),
      ),
    );
  }
}
