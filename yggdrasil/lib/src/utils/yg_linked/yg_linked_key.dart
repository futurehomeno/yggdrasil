part of 'yg_linked_builder.dart';

/// A key which links a [YgLinkedBuilder] and [YgLinkedProvider] together.
abstract interface class YgLinkedKey<T extends YgLinkedProvider<T>> implements Key {
  factory YgLinkedKey() = _LinkedKey<T>;

  BuildContext? get currentContext;
  Widget? get currentWidget;
}

class _LinkedKey<T extends YgLinkedProvider<T>> extends GlobalKey<State<StatefulWidget>> implements YgLinkedKey<T> {
  const _LinkedKey() : super.constructor();
}
