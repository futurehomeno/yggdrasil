import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/utils/yg_linked/_yg_linked.dart';

/// Internal widget which provides the hint widget to any other route using it.
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
