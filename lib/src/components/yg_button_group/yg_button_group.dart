import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonGroup extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgButtonGroup({
    super.key,
    required this.children,
    required this.axis,
  });

  factory YgButtonGroup.vertical({
    required List<YgButton> children,
  }) {
    return YgButtonGroup(
      axis: Axis.vertical,
      children: children,
    );
  }

  factory YgButtonGroup.verticalActionOrCancel({
    required String actionText,
    required String cancelText,
    required VoidCallback onActionPressed,
    required VoidCallback onCancelPressed,
  }) {
    return YgButtonGroup.vertical(
      children: <YgButton>[
        YgButton(
          onPressed: onActionPressed,
          child: Text(actionText),
        ),
        YgButton(
          variant: YgButtonVariant.link,
          onPressed: onCancelPressed,
          child: Text(cancelText),
        ),
      ],
    );
  }

  factory YgButtonGroup.horizontal({
    required List<YgButton> children,
  }) {
    return YgButtonGroup(
      axis: Axis.horizontal,
      children: children,
    );
  }

  factory YgButtonGroup.horizontalActionOrCancel({
    required String actionText,
    required String cancelText,
    required VoidCallback onActionPressed,
    required VoidCallback onCancelPressed,
  }) {
    return YgButtonGroup.horizontal(
      children: <YgButton>[
        YgButton(
          onPressed: onActionPressed,
          child: Text(actionText),
        ),
        YgButton(
          variant: YgButtonVariant.link,
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
    assert(children.isNotEmpty, 'ButtonGroup must have at least 1 buttons');
    assert(children.length <= 3, 'ButtonGroup can have at most 3 buttons');

    if (axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children.withVerticalSpacing(context.buttonGroupTheme.buttonSpacing),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children
          .map((Widget child) => Flexible(child: child))
          .toList()
          .withHorizontalSpacing(context.buttonGroupTheme.buttonSpacing),
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
