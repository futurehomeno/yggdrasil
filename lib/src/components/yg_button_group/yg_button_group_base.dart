part of 'yg_button_group.dart';

class YgButtonGroupBase extends YgButtonGroup {
  const YgButtonGroupBase({
    super.key,
    required this.children,
    required super.axis,
  }) : super._();

  const YgButtonGroupBase.vertical({
    super.key,
    required this.children,
  }) : super._(
          axis: Axis.vertical,
        );

  const YgButtonGroupBase.horizontal({
    super.key,
    required this.children,
  }) : super._(axis: Axis.horizontal);

  @override
  final List<YgButton> children;
}
