import 'package:flutter/material.dart';
import 'package:pubdev_registry/fh_utils/fh_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  static const String routeName = 'TextFieldScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
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
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: 'Variations',
              children: <Widget>[
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
                  suffix: const YgIcon(YgIcons.placeholder),
                  onSuffixPressed: () {},
                  autocorrect: true,
                ),
                const YgTextField(
                  label: 'Multi line',
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  completeAction: YgCompleteAction.focusNext,
                  autocorrect: true,
                  minLines: 2,
                  maxLines: null,
                ),
                const YgTextField(
                  label: 'Readonly',
                  initialValue: 'Readonly',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: true,
                  readOnly: true,
                ),
                const YgTextField(
                  label: 'Disabled',
                  initialValue: 'Disabled',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: true,
                  disabled: true,
                ),
              ].withVerticalSpacing(10.0),
            ),
            YgSection.column(
              title: 'Variants',
              children: <Widget>[
                const YgTextField(
                  label: 'Standard',
                  variant: YgFieldVariant.standard,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: true,
                ),
                const YgTextField(
                  label: 'Outlined',
                  variant: YgFieldVariant.outlined,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  autocorrect: true,
                ),
              ].withVerticalSpacing(10.0),
            ),
            YgSection(
              title: 'Login form example',
              subtitle: 'See example code for best-practice usage.',
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    YgTextFormField.email(
                      key: _emailKey,
                      label: 'Email',
                      textInputAction: TextInputAction.next,
                      validators: <FormFieldValidator<String>>[
                        const RequiredValidator(
                          requiredError: 'This field is required!',
                        ).call,
                        const EmailValidator(
                          invalidEmailError: 'Invalid email',
                        ).call,
                      ],
                    ),
                    YgTextFormField.password(
                      key: _passwordKey,
                      label: 'Password',
                      textInputAction: TextInputAction.done,
                      validators: <FormFieldValidator<String>>[
                        const RequiredValidator(
                          requiredError: 'This field is required!',
                        ).call,
                        PasswordValidator(
                          passwordTooShortError: 'Password is too short!',
                        ).call,
                      ],
                    ),
                    YgTextFormField.password(
                      key: _passwordConfirmKey,
                      label: 'Confirm password',
                      textInputAction: TextInputAction.done,
                      validators: <FormFieldValidator<String>>[
                        const RequiredValidator(
                          requiredError: 'This field is required!',
                        ).call,
                        MatchValidator<String>(
                          otherFieldKey: _passwordKey,
                          error: 'Passwords do not match!',
                        ).call,
                      ],
                    ),
                    YgButton(
                      onPressed: _onSubmit,
                      child: const Text('Submit'),
                    ),
                  ].withVerticalSpacing(10),
                ),
              ),
            ),
          ],
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
