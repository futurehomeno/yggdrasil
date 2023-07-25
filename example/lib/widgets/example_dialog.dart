import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialog extends YgDialogRoute {
  @override
  String get name => 'ExampleDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      header: const YgIcon(YgIcons.info),
      title: 'Example dialog',
      description: 'The description should provide the necessary information needed to make an informed decision.',
      ygButtonGroup: YgButtonGroup(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Primary button'),
          ),
          YgButton(
            variant: YgButtonVariant.secondary,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Secondary button'),
          ),
        ],
      ),
    );
  }
}
