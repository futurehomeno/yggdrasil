import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class ExampleDialogNoButtons extends YgDialogRoute {
  @override
  YgDialog buildDialog(BuildContext context) {
    return const YgDialog(
      header: YgIcon(YgIcons.info),
      title: 'Example dialog',
      description: 'The description should provide the necessary information needed to make an informed decision.',
    );
  }
}
