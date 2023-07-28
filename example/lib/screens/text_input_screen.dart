import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
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
  final TextFieldKey passwordConfirmKey = TextFieldKey();

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
            ),
            const YgTextInput(
              label: 'Label',
              size: YgTextInputSize.medium,
            ),
            const YgTextInput(
              label: 'Label',
              placeholder: 'Placeholder',
            ),
            const YgTextInput(
              label: 'Label',
              obscureText: true,
            ),
            const YgTextInput(
              label: 'Label',
              error: 'Error Message',
            ),
            const YgTextInput(
              label: 'Label',
              disabled: true,
            ),
            const YgListTile(title: 'Outlined variant'),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
            ),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              size: YgTextInputSize.medium,
            ),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              placeholder: 'Placeholder',
            ),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              obscureText: true,
            ),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              error: 'Error Message',
            ),
            const YgTextInput(
              label: 'Label',
              variant: YgTextInputVariant.outlined,
              disabled: true,
            ),
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
                    validators: const <TextValidator>[
                      RequiredValidator(),
                      EmailValidator(),
                    ],
                    label: 'Email',
                    variant: YgTextInputVariant.outlined,
                  ),
                  YgTextFormInput(
                    validators: const <TextValidator>[
                      RequiredValidator(),
                      PasswordValidator(),
                    ],
                    key: passwordKey,
                    label: 'Password',
                    obscureText: true,
                    variant: YgTextInputVariant.outlined,
                  ),
                  YgTextFormInput(
                    validators: <TextValidator>[
                      const RequiredValidator(),
                      PasswordConfirmValidator(
                        otherPasswordFieldKey: passwordKey,
                      )
                    ],
                    key: passwordConfirmKey,
                    label: 'Confirm password',
                    obscureText: true,
                    variant: YgTextInputVariant.outlined,
                  ),
                  YgButton(
                    variant: YgButtonVariant.primary,
                    onPressed: _validateForm,
                    child: const Text('Login'),
                  )
                ],
              ),
            )
          ],
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
      ExampleSignupFormDialog(
        email: email ?? '',
        password: password ?? '',
      ),
    );
  }
}
