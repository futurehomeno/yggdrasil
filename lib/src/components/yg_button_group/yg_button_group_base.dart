part of 'yg_button_group.dart';

class _YgButtonGroupBase extends YgButtonGroup {
  const _YgButtonGroupBase({
    super.key,
    required this.children,
    required super.axis,
  }) : super._();

  const _YgButtonGroupBase.vertical({
    super.key,
    required this.children,
  }) : super._(
          axis: Axis.vertical,
        );

  const _YgButtonGroupBase.horizontal({
    super.key,
    required this.children,
  }) : super._(axis: Axis.horizontal);

  @override
  final List<YgButton> children;
}
