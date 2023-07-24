import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialogNonDismissible extends YgDialogRoute {
  @override
  final bool barrierDismissible = false;

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog(
      header: const YgIcon(YgIcons.info),
      title: 'Non Dismissible Dialog',
      description: 'A dialog which can not be dismissed by the user without choosing a action.',
      ygButtonGroup: YgButtonGroup(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Action 1'),
          ),
          YgButton(
            variant: YgButtonVariant.secondary,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Action 2'),
          ),
        ],
      ),
    );
  }
}
