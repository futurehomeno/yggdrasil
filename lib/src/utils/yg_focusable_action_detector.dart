import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YgFocusableActionDetector extends StatelessWidget {
  const YgFocusableActionDetector({
    super.key,
    required this.child,
    this.onFocusChanged,
    this.onHoverChanged,
    this.onActivate,
    this.focusNode,
    this.onLongPress,
    this.autofocus = false,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.mouseCursor = MouseCursor.defer,
    this.behavior,
    this.enabled = true,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// See [GestureDetector.behavior].
  final HitTestBehavior? behavior;

  /// See [FocusableActionDetector.mouseCursor].
  final MouseCursor mouseCursor;

  /// Called when the focus state changed.
  final ValueChanged<bool>? onFocusChanged;

  /// Called when the hover state changed.
  final ValueChanged<bool>? onHoverChanged;

  /// See [GestureDetector.onLongPress].
  final VoidCallback? onLongPress;

  /// Called when the widget is clicked or activated through the keyboard.
  final VoidCallback? onActivate;

  /// See [FocusableActionDetector.autofocus].
  final bool autofocus;

  /// See [FocusableActionDetector.descendantsAreFocusable].
  final bool descendantsAreFocusable;

  /// See [FocusableActionDetector.descendantsAreTraversable].
  final bool descendantsAreTraversable;

  /// See [FocusableActionDetector.focusNode].
  final FocusNode? focusNode;

  /// Whether the widget is enabled.
  ///
  /// When set to false the widget will no longer:
  ///  - Be focusable
  ///  - Detect any gestures
  ///  - Call any callbacks
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onActivate = this.onActivate;

    return GestureDetector(
      behavior: behavior,
      onTap: enabled ? onActivate : null,
      onLongPress: enabled ? onLongPress : null,
      child: FocusableActionDetector(
        onShowHoverHighlight: onHoverChanged,
        onShowFocusHighlight: onFocusChanged,
        shortcuts: <ShortcutActivator, Intent>{
          if (onActivate != null)
            const SingleActivator(
              LogicalKeyboardKey.space,
              control: true,
            ): const ActivateIntent(),
          if (onActivate != null)
            const SingleActivator(
              LogicalKeyboardKey.enter,
              control: true,
            ): const ActivateIntent(),
        },
        actions: <Type, Action<Intent>>{
          if (onActivate != null)
            ActivateIntent: CallbackAction<Intent>(
              onInvoke: (_) => onActivate(),
            ),
        },
        mouseCursor: mouseCursor,
        descendantsAreFocusable: descendantsAreFocusable,
        descendantsAreTraversable: descendantsAreTraversable,
        focusNode: focusNode,
        autofocus: autofocus,
        enabled: enabled,
        child: child,
      ),
    );
  }
}
