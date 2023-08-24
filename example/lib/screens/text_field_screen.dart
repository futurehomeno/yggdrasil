import 'package:flutter/material.dart';
import 'package:pubdev_registry/fh_utils/fh_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  // ignore: prefer-widget-private-members
  static const String routeName = 'TextFieldScreen';

  // ignore: prefer-widget-private-members
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
  final FormKey _formKey = FormKey();
  final TextFieldKey _emailKey = TextFieldKey();
  final TextFieldKey _passwordKey = TextFieldKey();
  final TextFieldKey _passwordConfirmKey = TextFieldKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DemoScreen(
        componentName: 'TextField',
        componentDesc: 'Text Field',
        supernovaLink: 'Link',
        child: Column(
          children: <Widget>[
            const YgListTile(title: 'Variations'),
            const YgTextField(
              label: 'Default field',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgTextField(
              label: 'Obscured',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              obscureText: true,
            ),
            const YgTextField(
              label: 'Label',
              placeholder: 'Fixed placeholder',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            YgTextField(
              label: 'Custom suffix',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              suffix: const YgIcon(YgIcons.info),
              onSuffixPressed: () {},
            ),
            YgTextField(
              label: 'Readonly',
              controller: TextEditingController(text: 'Readonly'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              readOnly: true,
            ),
            YgTextField(
              label: 'Disabled',
              controller: TextEditingController(text: 'Disabled'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              disabled: true,
            ),
            const YgListTile(title: 'Variants'),
            const YgTextField(
              label: 'Standard',
              variant: YgTextFieldVariant.standard,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgTextField(
              label: 'Outlined',
              variant: YgTextFieldVariant.outlined,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgListTile(
              title: 'Login form example',
              subtitle: 'See example code for best-practice usage.',
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  YgTextFormField.email(
                    key: _emailKey,
                    label: 'Email',
                    textInputAction: TextInputAction.next,
                    autoValidate: YgAutoValidate.onComplete,
                    validators: [
                      RequiredValidator(
                        requiredError: 'This field is required!',
                      ),
                      EmailValidator(
                        invalidEmailError: 'Invalid email',
                      ),
                    ],
                  ),
                  YgTextFormField.password(
                    key: _passwordKey,
                    label: 'Password',
                    textInputAction: TextInputAction.done,
                    validators: [
                      RequiredValidator(
                        requiredError: 'This field is required!',
                      ),
                      PasswordValidator(
                        passwordTooShortError: 'Password is too short!',
                      ),
                    ],
                  ),
                  YgTextFormField.password(
                    key: _passwordConfirmKey,
                    label: 'Confirm password',
                    textInputAction: TextInputAction.done,
                    validators: [
                      RequiredValidator(
                        requiredError: 'This field is required!',
                      ),
                      MatchValidator(
                        otherFieldKey: _passwordKey,
                        error: 'Passwords do not match!',
                      ),
                    ],
                  ),
                  YgButton(
                    onPressed: _onSubmit,
                    child: const Text('Submit'),
                  ),
                ].withVerticalSpacing(10),
              ),
            ),
          ].withVerticalSpacing(10),
        ),
      ),
    );
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.validate()) {
      return;
    }

    final String email = _emailKey.value ?? '';
    final String password = _passwordKey.value ?? '';

    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Logging in with $email and $password.',
      ),
    );
  }
}
