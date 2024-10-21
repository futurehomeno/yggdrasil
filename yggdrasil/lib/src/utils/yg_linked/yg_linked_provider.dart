import 'package:flutter/widgets.dart';

import 'yg_linked_key.dart';

abstract class YgLinkedProvider<T extends YgLinkedProvider<T>> extends ProxyWidget {
  const YgLinkedProvider({
    required YgLinkedKey<T> super.key,
    required super.child,
  });

  @override
  Element createElement() {
    return YgLinkedUpdateProviderElement<T>(this);
  }

  bool updateShouldNotify(covariant YgLinkedProvider<T> oldWidget);
}

class YgLinkedUpdateProviderElement<T extends YgLinkedProvider<T>> extends ProxyElement {
  YgLinkedUpdateProviderElement(super.widget);

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
