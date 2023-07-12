import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialog extends YgDialogRoute {
  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      icon: 'icon',
      title: 'Example dialog',
      description: 'The description should provide the necessary information needed to make an informed decision.',
      actions: <YgButton>[
        YgButton(
          variant: ButtonVariant.primary,
          onPressed: () {},
          child: const Text('Primary button'),
        ),
        YgButton(
          variant: ButtonVariant.secondary,
          onPressed: () {},
          child: const Text('Secondary button'),
        ),
      ],
    );
  }
}
