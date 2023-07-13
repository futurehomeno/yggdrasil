import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialog extends YgDialogRoute {
  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      icon: SharedIcons.other25,
      title: 'Example dialog',
      description: 'The description should provide the necessary information needed to make an informed decision.',
      actions: <YgButton>[
        YgButton(
          variant: YgButtonVariant.primary,
          onPressed: () {},
          child: const Text('Primary button'),
        ),
        YgButton(
          variant: YgButtonVariant.secondary,
          onPressed: () {},
          child: const Text('Secondary button'),
        ),
      ],
    );
  }
}
