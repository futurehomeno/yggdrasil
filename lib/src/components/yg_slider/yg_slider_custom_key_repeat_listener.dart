import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YgSliderCustomKeyRepeatListener extends StatefulWidget {
  const YgSliderCustomKeyRepeatListener({
    super.key,
    required this.listeners,
    required this.focusNode,
    required this.child,
    required this.autoFocus,
    required this.interval,
    required this.onEditingChanged,
  });

  final Map<LogicalKeyboardKey, VoidCallback> listeners;
  final FocusNode focusNode;
  final Widget child;
  final bool autoFocus;
  final Duration interval;
  final ValueChanged<bool> onEditingChanged;

  @override
  State<YgSliderCustomKeyRepeatListener> createState() => _YgSliderCustomKeyRepeatListenerState();
}

class _YgSliderCustomKeyRepeatListenerState extends State<YgSliderCustomKeyRepeatListener> {
  final Map<LogicalKeyboardKey, Timer> _keyTimerMap = <LogicalKeyboardKey, Timer>{};

  bool _editing = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!widget.focusNode.hasFocus) {
      _cancelKeys();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: widget.focusNode,
      onKey: _handleKey,
      autofocus: widget.autoFocus,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant YgSliderCustomKeyRepeatListener oldWidget) {
    // Remove the timer for every key that is no longer in the listener map.
    final Set<LogicalKeyboardKey> oldKeys = Set<LogicalKeyboardKey>.of(oldWidget.listeners.keys);
    final Set<LogicalKeyboardKey> newKeys = Set<LogicalKeyboardKey>.of(widget.listeners.keys);
    final Set<LogicalKeyboardKey> removedKeys = oldKeys.difference(newKeys);

    for (final LogicalKeyboardKey removedKey in removedKeys) {
      _keyTimerMap.remove(removedKey)?.cancel();
    }

    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode.removeListener(_handleFocusChange);
      widget.focusNode.addListener(_handleFocusChange);
    }

    scheduleMicrotask(_updateEditing);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    _cancelKeys();
    super.dispose();
  }

  void _cancelKeys() {
    for (final Timer timer in _keyTimerMap.values) {
      timer.cancel();
    }
  }

  void _handleKey(RawKeyEvent event) {
    final LogicalKeyboardKey key = event.logicalKey;
    final VoidCallback? listener = widget.listeners[key];

    if (listener == null) {
      return;
    }

    if (event is RawKeyDownEvent) {
      listener();

      if (_keyTimerMap.containsKey(key) || event.repeat) {
        return;
      }

      _keyTimerMap[key] = Timer(
        const Duration(seconds: 1),
        // ignore: prefer-extracting-callbacks
        () {
          listener();
          _keyTimerMap[key] = Timer.periodic(
            widget.interval,
            // ignore: prefer-extracting-callbacks
            (Timer timer) {
              listener();
            },
          );
        },
      );
    }
    if (event is RawKeyUpEvent) {
      _keyTimerMap.remove(key)?.cancel();
    }
    _updateEditing();
  }

  void _updateEditing() {
    final bool newEditing = _keyTimerMap.isNotEmpty;

    if (_editing != newEditing) {
      _editing = newEditing;
      widget.onEditingChanged(newEditing);
    }
  }
}
