import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';
import 'package:yggdrasil_demo/widgets/login_form_dialog.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  static const String routeName = 'TextInputScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const TextFieldScreen(),
    );
  }

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
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
      child: DemoScreen(
        componentName: 'TextField',
        componentDesc: 'Text Field',
        supernovaLink: 'Input',
        child: Column(
          children: <Widget>[
            const YgListTile(title: 'Default variant'),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              size: YgTextFieldSize.medium,
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              placeholder: 'Placeholder',
            ),
            const YgTextField.password(
              textInputAction: TextInputAction.next,
              label: 'Label',
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              error: 'Error Message',
            ),
            const YgTextField.password(
              textInputAction: TextInputAction.next,
              label: 'Label',
              disabled: true,
            ),
            const YgTextField.multiline(
              label: 'Label',
              placeholder: 'Multi line',
              maxLines: 5,
              minLines: 2,
            ),
            const YgListTile(title: 'Outlined variant'),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
              size: YgTextFieldSize.medium,
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
              placeholder: 'Placeholder',
            ),
            const YgTextField.password(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
              error: 'Error Message',
            ),
            const YgTextField.text(
              textInputAction: TextInputAction.next,
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
              disabled: true,
            ),
            const YgTextField.multiline(
              label: 'Label',
              variant: YgTextFieldVariant.outlined,
              placeholder: 'Multi line',
              maxLines: 5,
              minLines: 2,
            ),
            const YgListTile(
              title: 'Example use in a form',
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  YgTextFormField.email(
                    required: true,
                    key: emailKey,
                    label: 'Email',
                    variant: YgTextFieldVariant.outlined,
                    textInputAction: TextInputAction.next,
                  ),
                  YgTextFormField.password(
                    required: true,
                    key: passwordKey,
                    label: 'Password',
                    textInputAction: TextInputAction.next,
                    variant: YgTextFieldVariant.outlined,
                  ),
                  YgTextFormField.password(
                    otherPasswordFieldKey: passwordKey,
                    key: passwordConfirmKey,
                    label: 'Confirm password',
                    variant: YgTextFieldVariant.outlined,
                    textInputAction: TextInputAction.done,
                  ),
                  YgButton(
                    variant: YgButtonVariant.primary,
                    onPressed: _validateForm,
                    child: const Text('Login'),
                  )
                ].withVerticalSpacing(10),
              ),
            )
          ].withVerticalSpacing(10),
        ),
      ),
    );
  }

  void _validateForm() {
    FocusScope.of(context).unfocus();

    final bool valid = formKey.validate();

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
