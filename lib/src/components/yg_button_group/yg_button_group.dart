import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonGroup extends StatelessWidget {
  const YgButtonGroup({
    super.key,
    required this.children,
    this.axis = Axis.vertical,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
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
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    assert(children.isNotEmpty, 'ButtonGroup must have at least 1 buttons');
    assert(children.length <= 3, 'ButtonGroup can have at most 3 buttons');

    if (axis == Axis.vertical) {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: children.withSpacing(
          verticalSpacing: context.buttonGroupTheme.buttonSpacing,
        ),
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      children: children.withSpacing(
        horizontalSpacing: context.buttonGroupTheme.buttonSpacing,
      ),
    );
  }
}
