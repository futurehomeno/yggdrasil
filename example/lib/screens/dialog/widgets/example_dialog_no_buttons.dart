import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialogNoButtons extends YgDialogRoute {
  @override
  String get name => 'ExampleDialogNoButtons';

  @override
  YgDialog buildDialog(BuildContext context) {
    return const YgDialog.highlight(
      title: 'Example dialog',
      description: 'The description should provide the necessary information needed to make an informed decision.',
    );
  }
}
