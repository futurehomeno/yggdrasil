import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_app_state.dart';

class SnackBarExampleDialog extends YgDialogRoute {
  OverlayEntry? overlayEntry;

  @override
  String get name => 'ExampleDialogNoButtons';

  @override
  Widget buildDialog(BuildContext context) {
    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return YgDialog.highlight(
          title: 'Example dialog',
          description: 'This dialog can open a snackbar which will be shown over top of the dialog it self.',
          buttons: YgButtonGroup.vertical(
            children: <YgButton>[
              YgButton(
                variant: YgButtonVariant.primary,
                onPressed: () => _showNewSnackBar(context),
                child: const Text('Show snackbar'),
              ),
              YgButton(
                variant: YgButtonVariant.secondary,
                onPressed: () {
                  overlayEntry?.remove();
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showNewSnackBar(BuildContext context) {
    YgSnackBarManager.of(context).showSnackBar(
      const YgSnackBar(
        message: 'SnackBar over top of a dialog',
      ),
    );
  }
}
