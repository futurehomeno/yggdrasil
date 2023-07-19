import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonGroup extends StatelessWidget {
  const YgButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.vertical,
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
          child: Text(cancelText),
        ),
      ],
    );
  }

  final List<YgButton> children;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    assert(children.length >= 2, 'ButtonGroup must have at least 2 buttons');
    assert(children.length <= 3, 'ButtonGroup can have at most 3 buttons');

    if (axis == Axis.vertical) {
      return Column(
        children: children.withSpacing(
          verticalSpacing: context.buttonGroupTheme.buttonSpacing,
        ),
      );
    }

    return Row(
      children: children.withSpacing(
        horizontalSpacing: context.buttonGroupTheme.buttonSpacing,
      ),
    );
  }
}
