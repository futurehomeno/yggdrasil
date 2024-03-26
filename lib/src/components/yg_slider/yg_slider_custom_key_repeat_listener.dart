import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_repeating_stepper_button.dart';

class YgSliderCustomKeyRepeatListener extends StatefulWidget {
  const YgSliderCustomKeyRepeatListener({
    super.key,
    required this.listeners,
    required this.focusNode,
    required this.child,
    required this.autoFocus,
    required this.interval,
    required this.onEditingChanged,
    required this.repeatDelay,
  });

  final Map<LogicalKeyboardKey, RepeatableCallback> listeners;
  final FocusNode focusNode;
  final Widget child;
  final bool autoFocus;
  final Duration interval;
  final ValueChanged<bool> onEditingChanged;
  final Duration repeatDelay;

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
    if (event.repeat) {
      return;
    }

    final LogicalKeyboardKey key = event.logicalKey;
    final RepeatableCallback? listener = widget.listeners[key];

    if (listener == null) {
      return;
    }

    if (event is RawKeyDownEvent) {
      listener(repeat: false);

      if (_keyTimerMap.containsKey(key)) {
        return;
      }

      _keyTimerMap[key] = Timer(
        widget.repeatDelay,
        // ignore: prefer-extracting-callbacks
        () {
          listener(repeat: true);
          _keyTimerMap[key] = Timer.periodic(
            widget.interval,
            // ignore: prefer-extracting-callbacks
            (Timer timer) {
              listener(repeat: true);
            },
          );
        },
      );
    }
    if (event is RawKeyUpEvent) {
      print('upppppppp');
      print(event);
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
