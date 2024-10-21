import 'package:flutter/widgets.dart';

import 'yg_linked_key.dart';
import 'yg_linked_provider.dart';

class YgLinkedBuilder<T extends YgLinkedProvider<T>> extends Widget {
  const YgLinkedBuilder({
    super.key,
    required this.builder,
    required this.linkedKey,
  });

  final Widget Function(T? linkedWidget) builder;
  final YgLinkedKey<T> linkedKey;

  @override
  YgLinkedBuilderElement<T> createElement() {
    return YgLinkedBuilderElement<T>(this);
  }
}

class YgLinkedBuilderElement<T extends YgLinkedProvider<T>> extends ComponentElement {
  YgLinkedBuilderElement(super.widget);

  bool _hadUnsatisfiedDependency = false;

  @override
  YgLinkedBuilder<T> get widget => super.widget as YgLinkedBuilder<T>;

  YgLinkedUpdateProviderElement<T>? get _linkedElement =>
      widget.linkedKey.currentContext as YgLinkedUpdateProviderElement<T>?;

  @override
  Widget build() {
    final YgLinkedUpdateProviderElement<T>? linkedElement = _linkedElement;

    final T? remoteWidget;
    if (linkedElement != null) {
      remoteWidget = _linkedElement?.widget as T?;
      _linkedElement?.addDependent(this);
      _hadUnsatisfiedDependency = true;
    } else {
      remoteWidget = null;
    }

    return widget.builder(remoteWidget);
  }

  @override
  void activate() {
    super.activate();
    final bool hadDependencies = _linkedElement != null || _hadUnsatisfiedDependency;
    _hadUnsatisfiedDependency = false;
    if (hadDependencies) {
      didChangeDependencies();
    }
  }

  @override
  void deactivate() {
    final YgLinkedUpdateProviderElement<T>? linkedElement = _linkedElement;
    if (linkedElement != null) {
      linkedElement.removeDependent(this);
    }
    super.deactivate();
  }
}
