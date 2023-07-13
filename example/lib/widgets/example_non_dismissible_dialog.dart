import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleNonDismissibleDialog extends YgDialogRoute {
  @override
  final bool barrierDismissible = false;

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      icon: 'icon',
      title: 'Non Dismissible Dialog',
      description: 'A dialog which can not be dismissed by the user without choosing a action.',
      actions: <YgButton>[
        YgButton(
          variant: ButtonVariant.primary,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Action 1'),
        ),
        YgButton(
          variant: ButtonVariant.secondary,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Action 2'),
        ),
      ],
    );
  }
}
