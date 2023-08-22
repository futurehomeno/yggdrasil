import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_route_builder.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  static const String routeName = 'TextFieldScreen';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DemoScreen(
        componentName: 'TextField',
        componentDesc: 'Text Field',
        supernovaLink: 'Link',
        child: Column(
          children: <Widget>[
            const YgListTile(title: 'Variations'),
            const YgTextField(
              label: 'Default field',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgTextField(
              label: 'Obscured',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              obscureText: true,
            ),
            const YgTextField(
              label: 'Label',
              placeholder: 'Fixed placeholder',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            YgTextField(
              label: 'Custom suffix',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              suffix: const YgIcon(YgIcons.info),
              onSuffixPressed: () {},
            ),
            YgTextField(
              label: 'Readonly',
              controller: TextEditingController(text: 'Readonly'),
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              readOnly: true,
            ),
            YgTextField(
              label: 'Disabled',
              controller: TextEditingController(text: 'Disabled'),
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
              disabled: true,
            ),
            const YgListTile(title: 'Variants'),
            const YgTextField(
              label: 'Standard',
              variant: YgTextFieldVariant.standard,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgTextField(
              label: 'Outlined',
              variant: YgTextFieldVariant.outlined,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
              autocorrect: true,
            ),
            const YgListTile(
              title: 'Login form example',
              subtitle: 'See example code for best-practice usage.',
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  YgTextFormField.email(
                    key: emailKey,
                    label: 'Email',
                    textInputAction: TextInputAction.next,
                    validator: _demoEmailValidator,
                    onEditingComplete: () {
                      if (emailKey.currentState!.validate()) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  YgTextFormField.password(
                    key: passwordKey,
                    label: 'Password',
                    textInputAction: TextInputAction.done,
                    validator: _demoPasswordValidator,
                    onEditingComplete: () {
                      if (passwordKey.currentState!.validate()) {
                        _onSubmit();
                      }
                    },
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

  String? _demoEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }

    const String pattern = r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _demoPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    const int minLength = 8;
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    return null;
  }

  void _onSubmit() {
    FocusScope.of(context).unfocus();

    if (!formKey.validate()) {
      return;
    }

    final String email = emailKey.value ?? '';
    final String password = passwordKey.value ?? '';

    ScaffoldMessenger.of(context).showSnackBar(
      YgSnackBar(
        context: context,
        message: 'Logging in with $email and $password.',
      ),
    );
  }
}
