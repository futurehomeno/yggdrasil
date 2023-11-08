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

  final HitTestBehavior? behavior;
  final Widget child;
  final MouseCursor mouseCursor;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<bool>? onHoverChanged;
  final VoidCallback? onLongPress;
  final VoidCallback? onActivate;
  final bool autofocus;
  final bool descendantsAreFocusable;
  final bool descendantsAreTraversable;
  final FocusNode? focusNode;
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
