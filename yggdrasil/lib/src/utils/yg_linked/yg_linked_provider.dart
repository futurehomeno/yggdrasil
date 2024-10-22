part of 'yg_linked_builder.dart';

/// A provider which provides it self to a linked [YgLinkedBuilder].
///
/// Forces the [YgLinkedBuilder] to build when this provider gets build and
/// [updateShouldNotify] returns true.
///
/// !--- WARNING ---
/// This widget is somewhat experimental and its behavior is not 100% known.
/// This widget should probably only be used if the widgets linked together are
/// not direct ancestors. More experiments should be done before broadly applying
/// this widget.
abstract class YgLinkedProvider<T extends YgLinkedProvider<T>> extends ProxyWidget {
  const YgLinkedProvider({
    required YgLinkedKey<T> super.key,
    required super.child,
  });

  @override
  Element createElement() {
    return _YgLinkedUpdateProviderElement<T>(this);
  }

  bool updateShouldNotify(covariant YgLinkedProvider<T> oldWidget);
}

class _YgLinkedUpdateProviderElement<T extends YgLinkedProvider<T>> extends ProxyElement {
  _YgLinkedUpdateProviderElement(super.widget);

  final Set<Element> _dependents = <Element>{};

  void addDependent(Element dependent) {
    _dependents.add(dependent);
  }

  void removeDependent(Element dependent) {
    _dependents.remove(dependent);
  }

  @override
  void updated(YgLinkedProvider<T> oldWidget) {
    if ((widget as YgLinkedProvider<T>).updateShouldNotify(oldWidget)) {
      super.updated(oldWidget);
    }
  }

  @override
  void notifyClients(YgLinkedProvider<T> oldWidget) {
    for (final Element dependent in _dependents) {
      dependent.rebuild(force: true);
    }
  }
}
