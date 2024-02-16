import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class SuccessDialog extends YgDialogRoute {
  @override
  String get name => 'SuccessDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog.success(
      title: 'Success dialog',
      description: 'The success variant of a dialog.',
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
