import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleSignupFormDialog extends YgDialogRoute {
  ExampleSignupFormDialog({
    required this.email,
    required this.password,
  });

  @override
  final String name = 'ExampleSignupFormDialog';

  final String email;
  final String password;

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      header: const YgIcon(YgIcons.info),
      title: 'Login Successful',
      description: 'You were logged in using email $email and password $password',
      ygButtonGroup: YgButtonGroup(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
