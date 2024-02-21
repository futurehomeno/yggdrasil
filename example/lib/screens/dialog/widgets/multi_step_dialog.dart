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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,
      child: switch (_state) {
        0 => _buildInitialDialog(),
        1 => _buildLoadingDialog(),
        _ => _buildCompletedDialog(),
      },
    );
  }

  YgDialog _buildInitialDialog() {
    return YgDialog(
      key: const ValueKey<String>('confirm'),
      header: const YgIcon(YgIcons.info),
      title: 'Save changes',
      description: 'Do you want to save your changes?',
      ygButtonGroup: YgButtonGroup.verticalActionOrCancel(
        actionText: 'Save',
        cancelText: 'Cancel',
        onActionPressed: _showLoading,
        onCancelPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildLoadingDialog() {
    return const FractionallySizedBox(
      widthFactor: 1,
      child: YgDialog(
        key: ValueKey<String>('Loading'),
        header: CircularProgressIndicator(),
        title: 'Loading...',
      ),
    );
  }

  YgDialog _buildCompletedDialog() {
    return YgDialog(
      key: const ValueKey<String>('Completed'),
      header: const YgIcon(YgIcons.check),
      title: 'Saving completed',
      description: 'Your changes have been saved.',
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
