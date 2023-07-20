import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/extensions/widget_list_extensions.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  static const String routeName = 'TextInputScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TextInputScreen(),
    );
  }

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextFieldKey key = TextFieldKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: YgScreen(
        componentName: 'Text Input',
        componentDesc: 'Text Input',
        supernovaLink: 'Input',
        child: Column(
          children: <Widget>[
            YgTextInput(
              fieldKey: key,
              label: 'Label',
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              size: YgTextInputSize.medium,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              variant: YgTextInputVariant.outlined,
            ),
            YgTextInput(
              fieldKey: key,
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              size: YgTextInputSize.medium,
            ),
          ].inspectable.spaced20,
        ),
      ),
    );
  }
}
