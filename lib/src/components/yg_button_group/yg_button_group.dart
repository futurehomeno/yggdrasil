import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonGroup extends StatelessWidget {
  const YgButtonGroup({
    super.key,
    required this.children,
  });

  factory YgButtonGroup.actionOrCancel({
    required String actionText,
    required String cancelText,
    required VoidCallback onActionPressed,
    required VoidCallback onCancelPressed,
  }) {
    return YgButtonGroup(
      children: <YgButton>[
        YgButton(
          variant: YgButtonVariant.primary,
          size: YgButtonSize.medium,
          onPressed: onActionPressed,
          child: Text(actionText),
        ),
        YgButton(
          variant: YgButtonVariant.link,
          size: YgButtonSize.medium,
          onPressed: onCancelPressed,
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  final List<YgButton> children;

  @override
  Widget build(BuildContext context) {
    assert(children.length >= 2, 'ButtonGroup must have at least 2 buttons');
    assert(children.length <= 3, 'ButtonGroup can have at most 3 buttons');

    return ListView.separated(
      shrinkWrap: true,
      itemCount: children.length,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.buttonGroupTheme.buttonSpacing);
      },
    );
  }
}
