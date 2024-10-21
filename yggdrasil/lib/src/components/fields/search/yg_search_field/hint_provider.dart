part of 'yg_search_field.dart';

class HintProvider extends YgLinkedProvider<HintProvider> {
  const HintProvider({
    required super.key,
    required super.child,
    required this.hint,
  });

  final Widget? hint;

  @override
  bool updateShouldNotify(HintProvider oldWidget) {
    return oldWidget.hint != hint;
  }
}
