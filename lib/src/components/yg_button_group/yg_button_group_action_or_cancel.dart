part of 'yg_button_group.dart';

class _YgButtonGroupActionOrCancel extends YgButtonGroup {
  const _YgButtonGroupActionOrCancel.vertical({
    super.key,
    required this.actionText,
    required this.cancelText,
    required this.onActionPressed,
    required this.onCancelPressed,
  }) : super._(
          axis: Axis.vertical,
        );

  const _YgButtonGroupActionOrCancel.horizontal({
    super.key,
    required this.actionText,
    required this.cancelText,
    required this.onActionPressed,
    required this.onCancelPressed,
  }) : super._(
          axis: Axis.horizontal,
        );

  final String actionText;
  final VoidCallback onActionPressed;
  final String cancelText;
  final VoidCallback onCancelPressed;

  @override
  List<YgButton> get children {
    return <YgButton>[
      YgButton(
        onPressed: onActionPressed,
        child: Text(actionText),
      ),
      YgButton(
        variant: YgButtonVariant.link,
        onPressed: onCancelPressed,
        child: Text(cancelText),
      ),
    ];
  }
}
