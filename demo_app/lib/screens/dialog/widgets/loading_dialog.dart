import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class LoadingDialog extends YgDialogRoute {
  @override
  String get name => 'LoadingDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return const YgDialog.loading(
      title: 'Loading dialog',
      description: 'The loading variant of a dialog.',
    );
  }
}
