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
        supernovaLink: 'Input',
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
            const YgListTile(title: 'Login form example'),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  YgTextFormField(
                    key: emailKey,
                    label: 'Email',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: true,
                  ),
                  YgTextFormField(
                    key: passwordKey,
                    label: 'Password',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: true,
                    obscureText: true,
                  ),
                ].withVerticalSpacing(10),
              ),
            )
          ].withVerticalSpacing(10),
        ),
      ),
    );
  }
}
