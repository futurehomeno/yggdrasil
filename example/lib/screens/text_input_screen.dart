import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/extensions/_extensions.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';
import 'package:yggdrasil_demo/widgets/login_form_dialog.dart';

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
  final FormKey formKey = FormKey();
  final TextFieldKey emailKey = TextFieldKey();
  final TextFieldKey passwordKey = TextFieldKey();

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
            const YgListTile(title: 'Default variant'),
            const YgTextInput(
              label: 'Label',
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              size: YgTextInputSize.medium,
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              placeholder: 'Placeholder',
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              obscureText: true,
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              error: 'Error Message',
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              disabled: true,
            ).inspectable,
            const YgListTile(title: 'Outlined variant'),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              size: YgTextInputSize.medium,
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              placeholder: 'Placeholder',
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              obscureText: true,
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              error: 'Error Message',
            ).inspectable,
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              disabled: true,
            ).inspectable,
            const YgListTile(
              title: 'Example use in a form',
              subtitle: 'Valid password: password123',
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  YgTextFormInput(
                    key: emailKey,
                    label: 'Email',
                    variant: YgTextInputVariant.outlined,
                  ).inspectable,
                  YgTextFormInput(
                    key: passwordKey,
                    label: 'Password',
                    obscureText: true,
                    variant: YgTextInputVariant.outlined,
                  ).inspectable,
                  YgButton(
                    variant: YgButtonVariant.primary,
                    onPressed: _validateForm,
                    child: const Text('Login'),
                  )
                ].spaced20,
              ),
            )
          ].spaced20,
        ),
      ),
    );
  }

  void _validateForm() {
    final bool valid = formKey.validate();

    FocusScope.of(context).unfocus();

    if (!valid) {
      return;
    }

    final String? email = emailKey.value;
    final String? password = passwordKey.value;

    Navigator.of(context).push(
      ExampleLoginFormDialog(
        email: email ?? '',
        password: password ?? '',
      ),
    );
  }
}
