part of 'yg_picker.dart';

class YgPickerMultiColumn extends YgPicker {
  const YgPickerMultiColumn({
    super.key,
    super.metric,
    required this.columns,
  }) : super._();

  @override
  final List<YgPickerColumn<Object?>> columns;
}
