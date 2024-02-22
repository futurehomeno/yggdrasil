import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class InfoDialog extends YgDialogRoute {
  @override
  String get name => 'InfoDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return YgDialog.highlight(
      title: 'Info dialog',
      description: 'The info variant of a dialog.',
      buttons: YgButtonGroup.vertical(
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
