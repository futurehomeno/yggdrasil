import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/widgets/yg_screen.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_buttons/enums/yg_button_size.dart';
import 'package:yggdrasil/src/components/yg_buttons/enums/yg_button_variant.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String routeName = 'ButtonsScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ButtonsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Button',
      componentDesc: 'Buttons',
      supernovaLink: 'Link',
      child: Column(
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.secondary,
            size: ButtonSize.small,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.secondary,
            size: ButtonSize.medium,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.secondary,
            size: ButtonSize.large,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.secondary,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.secondary,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.text,
            size: ButtonSize.small,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.text,
            size: ButtonSize.medium,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.text,
            size: ButtonSize.large,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.text,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.text,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.link,
            size: ButtonSize.small,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.link,
            size: ButtonSize.medium,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.link,
            size: ButtonSize.large,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.link,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.link,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.critical,
            size: ButtonSize.small,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.critical,
            size: ButtonSize.medium,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton(
            variant: ButtonVariant.critical,
            size: ButtonSize.large,
            onPressed: () {},
            child: const Text('Button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.critical,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.critical,
            size: ButtonSize.small,
            onPressed: () {},
            icon: const Icon(Icons.add),
            child: const Text('Button'),
          ),
          const YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: null,
            child: Text('Disabled button'),
          ),
          const YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: null,
            child: Text('Disabled button'),
          ),
          const YgButton(
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            onPressed: null,
            child: Text('Disabled button'),
          ),
          YgButton.leftIcon(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: null,
            icon: const Icon(Icons.add),
            child: const Text('Disabled button'),
          ),
          YgButton.rightIcon(
            variant: ButtonVariant.primary,
            size: ButtonSize.small,
            onPressed: null,
            icon: const Icon(Icons.add),
            child: const Text('Disabled button'),
          ),
        ],
      ),
    );
  }
}
