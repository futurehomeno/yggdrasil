import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class LoadingDialog extends YgDialogRoute {
  @override
  String get name => 'LoadingDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog.loading(
      title: 'Loading dialog',
      description: 'The loading variant of a dialog.',
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
