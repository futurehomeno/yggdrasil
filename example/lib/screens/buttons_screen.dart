import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          YgCard(
            title: 'PrimaryButton',
            child: Column(
              children: <Widget>[
                YgButton(
                  variant: ButtonVariant.primary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.primary,
                  size: ButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.primary,
                  size: ButtonSize.large,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.leftIcon(
                  variant: ButtonVariant.primary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.rightIcon(
                  variant: ButtonVariant.primary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
          YgCard(
            title: 'Secondary Button',
            child: Column(
              children: <Widget>[
                YgButton(
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.large,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.leftIcon(
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.rightIcon(
                  variant: ButtonVariant.secondary,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
          YgCard(
            title: 'Text Button',
            child: Column(
              children: <Widget>[
                YgButton(
                  variant: ButtonVariant.text,
                  size: ButtonSize.small,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.text,
                  size: ButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.text,
                  size: ButtonSize.large,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.leftIcon(
                  variant: ButtonVariant.text,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.rightIcon(
                  variant: ButtonVariant.text,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
          YgCard(
            title: 'Critical Button',
            child: Column(
              children: <Widget>[
                YgButton(
                  variant: ButtonVariant.critical,
                  size: ButtonSize.small,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.critical,
                  size: ButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.critical,
                  size: ButtonSize.large,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.leftIcon(
                  variant: ButtonVariant.critical,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.rightIcon(
                  variant: ButtonVariant.critical,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
          YgCard(
            title: 'Link Button',
            child: Column(
              children: <Widget>[
                YgButton(
                  variant: ButtonVariant.link,
                  size: ButtonSize.small,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.link,
                  size: ButtonSize.medium,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton(
                  variant: ButtonVariant.link,
                  size: ButtonSize.large,
                  onPressed: () {},
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.leftIcon(
                  variant: ButtonVariant.link,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
                const SizedBox(height: 8.0),
                YgButton.rightIcon(
                  variant: ButtonVariant.link,
                  size: ButtonSize.small,
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
