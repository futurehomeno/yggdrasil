import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'yg_button_group_action_or_cancel.dart';
part 'yg_button_group_base.dart';

/// Implementation of yggdrasil button group.
///
/// Provides some common patterns for buttons.
abstract class YgButtonGroup extends StatelessWidget with StatelessWidgetDebugMixin {
  const factory YgButtonGroup({
    Key? key,
    required Axis axis,
    required List<YgButton> children,
  }) = _YgButtonGroupBase;

  /// A vertical button group.
  const factory YgButtonGroup.vertical({
    Key? key,
    required List<YgButton> children,
  }) = _YgButtonGroupBase.vertical;

  /// A horizontal button group.
  const factory YgButtonGroup.horizontal({
    Key? key,
    required List<YgButton> children,
  }) = _YgButtonGroupBase.horizontal;

  /// A button group with 2 buttons stacked on top of each other.
  ///
  /// The buttons will be show in the following order:
  ///  * Action (Primary variant)
  ///  * Cancel (Link variant)
  const factory YgButtonGroup.verticalActionOrCancel({
    Key? key,
    required String actionText,
    required String cancelText,
    required void Function() onActionPressed,
    required void Function() onCancelPressed,
  }) = _YgButtonGroupActionOrCancel.vertical;

  /// A button group with 2 buttons stacked next to each other.
  ///
  /// The buttons will be show in the following order:
  ///  * Action (Primary variant)
  ///  * Cancel (Link variant)
  const factory YgButtonGroup.horizontalActionOrCancel({
    Key? key,
    required String actionText,
    required String cancelText,
    required void Function() onActionPressed,
    required void Function() onCancelPressed,
  }) = _YgButtonGroupActionOrCancel.horizontal;

  const YgButtonGroup._({
    super.key,
    required this.axis,
  });

  List<YgButton> get children;
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
