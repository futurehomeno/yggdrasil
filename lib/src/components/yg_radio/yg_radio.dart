import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_radio_style.dart';

/// Yggdrasil radio button.
///
/// The widget consists of three circles stacked on top of one another.
/// The first circle creates the background (or border when not selected).
/// The second circle creates the handle, large when not selected, small when selected.
/// The last circle creates the helper handle, only used for the disabled state.
class YgRadio<T> extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for a group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Callback to trigger when the value of the radio changes.
  ///
  /// The radio itself does not maintain any state. Instead, when the state of
  /// the radio changes, the widget calls the [onChanged] callback.
  final ValueChanged<T?>? onChanged;

  bool get _enabled => onChanged != null;

  bool get _selected => value == groupValue;

  @override
  State<YgRadio<T>> createState() => _YgRadioState<T>();

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgRadioState<T> extends State<YgRadio<T>> {
  // region StatesController
  void _handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  final MaterialStatesController _statesController = MaterialStatesController();

  void _initStatesController() {
    _statesController.update(MaterialState.disabled, !widget._enabled);
    _statesController.update(MaterialState.selected, widget._selected);
    _statesController.addListener(_handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    _initStatesController();
  }

  @override
  void didUpdateWidget(covariant YgRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget._selected != oldWidget._selected) {
      _statesController.update(MaterialState.selected, widget._selected);
    }

    if (widget._enabled != oldWidget._enabled) {
      _statesController.update(MaterialState.disabled, !widget._enabled);
      if (!widget._enabled) {
        // The radio may have been disabled while a press gesture is currently underway.
        _statesController.update(MaterialState.pressed, false);
      }
    }
  }

  @override
  void dispose() {
    _statesController.removeListener(_handleStatesControllerChange);
    _statesController.dispose();
    super.dispose();
  }
  // endregion StatesController

  @override
  Widget build(BuildContext context) {
    final YgRadioTheme radioTheme = context.radioTheme;
    final YgRadioStyle radioStyle = YgRadioStyle.base(context);
    final Color resolvedBackgroundColor = radioStyle.backgroundColor.resolve(_statesController.value);
    final Color resolvedHandleColor = radioStyle.handleColor.resolve(_statesController.value);
    final double resolvedHandleSize = radioStyle.handleSize.resolve(_statesController.value);
    final double resolvedHelperHandleSize = radioStyle.helperHandleSize.resolve(_statesController.value);
    final MouseCursor resolvedMouseCursor = radioStyle.mouseCursor.resolve(_statesController.value);

    return RepaintBoundary(
      child: Semantics(
        checked: widget._selected,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onChanged == null ? null : _onTap,
          child: FocusableActionDetector(
            onShowHoverHighlight: _onShowHoverHighlight,
            onShowFocusHighlight: _onShowFocusHighlight,
            shortcuts: const <ShortcutActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.space, control: true): ActivateIntent(),
            },
            actions: <Type, Action<Intent>>{
              ActivateIntent: CallbackAction<Intent>(onInvoke: (_) => _onTap()),
            },
            mouseCursor: resolvedMouseCursor,
            enabled: widget._enabled,
            child: Padding(
              padding: EdgeInsets.all(context.radioTheme.padding),
              child: CustomPaint(
                size: Size.square(radioTheme.size),
                painter: _YgRadioPainter(
                  radioSize: radioTheme.size,
                  resolvedBackgroundColor: resolvedBackgroundColor,
                  helperHandleColor: radioTheme.helperHandleColor,
                  resolvedHandleColor: resolvedHandleColor,
                  resolvedHandleSize: resolvedHandleSize,
                  resolvedHelperHandleSize: resolvedHelperHandleSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onShowFocusHighlight(bool value) {
    _statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    _statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    final ValueChanged<T?>? onChanged = widget.onChanged;
    if (onChanged != null) {
      onChanged(widget.value);
    }
  }
}

class _YgRadioPainter extends CustomPainter {
  const _YgRadioPainter({
    required this.radioSize,
    required this.resolvedBackgroundColor,
    required this.helperHandleColor,
    required this.resolvedHandleColor,
    required this.resolvedHandleSize,
    required this.resolvedHelperHandleSize,
  });

  final double radioSize;
  final Color resolvedBackgroundColor;
  final double resolvedHandleSize;
  final Color resolvedHandleColor;
  final double resolvedHelperHandleSize;
  final Color helperHandleColor;

  @override
  void paint(Canvas canvas, Size objectSize) {
    final Paint backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = resolvedBackgroundColor;

    final Paint handlerPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = resolvedHandleColor;

    final Paint helperHandlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = helperHandleColor;

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      radioSize / 2.0,
      backgroundPaint,
    );

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      resolvedHandleSize / 2.0,
      handlerPaint,
    );

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      resolvedHelperHandleSize / 2.0,
      helperHandlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
