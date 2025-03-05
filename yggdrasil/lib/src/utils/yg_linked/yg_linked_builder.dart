import 'package:flutter/widgets.dart';

part 'yg_linked_key.dart';
part 'yg_linked_provider.dart';

/// A builder which rebuilds when the linked [YgLinkedProvider] rebuilds.
///
/// !--- WARNING ---
/// This widget is somewhat experimental and its behavior is not 100% known.
/// This widget should probably only be used if the widgets linked together are
/// not direct ancestors. More experiments should be done before broadly applying
/// this widget.
class YgLinkedBuilder<T extends YgLinkedProvider<T>> extends Widget {
  const YgLinkedBuilder({
    super.key,
    required this.builder,
    required this.linkedKey,
  });

  /// Builds a child widget using the linked widget.
  final Widget Function(T? linkedWidget) builder;

  /// The key linking the provider and builder together.
  final YgLinkedKey<T> linkedKey;

  @override
  Element createElement() {
    return _YgLinkedBuilderElement<T>(this);
  }
}

class _YgLinkedBuilderElement<T extends YgLinkedProvider<T>> extends ComponentElement {
  _YgLinkedBuilderElement(super.widget);

  bool _hadUnsatisfiedDependency = false;

  @override
  YgLinkedBuilder<T> get widget => super.widget as YgLinkedBuilder<T>;

  _YgLinkedUpdateProviderElement<T>? get _linkedElement =>
      widget.linkedKey.currentContext as _YgLinkedUpdateProviderElement<T>?;

  @override
  Widget build() {
    final _YgLinkedUpdateProviderElement<T>? linkedElement = _linkedElement;

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
    final _YgLinkedUpdateProviderElement<T>? linkedElement = _linkedElement;
    if (linkedElement != null) {
      linkedElement.removeDependent(this);
    }
    super.deactivate();
  }
}
