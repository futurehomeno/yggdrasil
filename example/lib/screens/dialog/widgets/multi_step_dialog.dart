import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class MultiStepDialog extends YgDialogRoute {
  @override
  String get name => 'ExampleDialogNoButtons';

  @override
  Widget buildDialog(BuildContext context) {
    return const DialogContent();
  }
}

class DialogContent extends StatefulWidget {
  const DialogContent({
    super.key,
  });

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return switch (_state) {
      0 => _buildInitialDialog(),
      1 => _buildLoadingDialog(),
      _ => _buildCompletedDialog(),
    };
  }

  YgDialog _buildInitialDialog() {
    return YgDialog(
      title: 'Save changes',
      description: 'Do you want to save your changes?',
      buttons: YgButtonGroup.verticalActionOrCancel(
        actionText: 'Save',
        cancelText: 'Cancel',
        onActionPressed: _showLoading,
        onCancelPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildLoadingDialog() {
    return const YgDialog.loading(
      title: 'Loading...',
    );
  }

  YgDialog _buildCompletedDialog() {
    return YgDialog.success(
      title: 'Saving completed',
      description: 'Your changes have been saved.',
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

  void _showLoading() async {
    _state++;
    setState(() {});

    await Future<void>.delayed(const Duration(seconds: 2));

    if (mounted) {
      _state++;
      setState(() {});
    }
  }
}
