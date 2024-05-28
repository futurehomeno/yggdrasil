import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_repeating_stepper_button.dart';

/// Detects a held key and creates a custom interval key repeat loop.
///
/// Needed to allow us to increase the slider value at a consistent percentage
/// when holding a key.
///
/// Does not work on the android emulator because of this issue:
/// https://github.com/flutter/flutter/issues/72816
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

  /// A map of keys and their respective callbacks.
  final Map<LogicalKeyboardKey, RepeatableCallback> listeners;

  /// The focusNode managing the focus of this widget.
  final FocusNode focusNode;

  /// The widget below this widget in the widget tree.
  final Widget child;

  /// Whether the widget should auto focus on initial build.
  final bool autoFocus;

  /// The interval of the key repeat.
  final Duration interval;

  /// Called when the status of whether a users is currently pressing a key changes.
  final ValueChanged<bool> onEditingChanged;

  /// The delay before a key starts to repeat.
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
    return Focus(
      focusNode: widget.focusNode,
      onKeyEvent: _handleKey,
      autofocus: widget.autoFocus,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant YgSliderCustomKeyRepeatListener oldWidget) {
    super.didUpdateWidget(oldWidget);
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

  KeyEventResult _handleKey(FocusNode focusNode, KeyEvent event) {
    final LogicalKeyboardKey key = event.logicalKey;
    final RepeatableCallback? listener = widget.listeners[key];

    if (listener == null) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent) {
      listener(repeat: false);

      if (_keyTimerMap.containsKey(key)) {
        return KeyEventResult.handled;
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
    if (event is KeyUpEvent) {
      _keyTimerMap.remove(key)?.cancel();
    }
    _updateEditing();

    return KeyEventResult.handled;
  }

  void _updateEditing() {
    final bool newEditing = _keyTimerMap.isNotEmpty;

    if (_editing != newEditing) {
      _editing = newEditing;
      widget.onEditingChanged(newEditing);
    }
  }
}
