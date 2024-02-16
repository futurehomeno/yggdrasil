import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ErrorDialog extends YgDialogRoute {
  @override
  String get name => 'ErrorDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog.error(
      title: 'Error dialog',
      description: 'The error variant of a dialog.',
      ygButtonGroup: YgButtonGroup.vertical(
        children: <YgButton>[
          YgButton(
            variant: YgButtonVariant.primary,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
