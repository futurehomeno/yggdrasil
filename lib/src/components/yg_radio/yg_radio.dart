import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_radio/enums/yg_radio_state.dart';
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
  late final YgStatesController<YgRadioState> _statesController = YgStatesController<YgRadioState>(
    <YgRadioState>{
      if (!widget._enabled) YgRadioState.disabled,
      if (widget._selected) YgRadioState.selected,
    },
  );

  @override
  void didUpdateWidget(covariant YgRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    _statesController.update(YgRadioState.disabled, !widget._enabled);
    _statesController.update(YgRadioState.selected, widget._selected);
  }

  @override
  void dispose() {
    _statesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgStyleBuilder<YgRadioStyle>(
      createStyle: (YgVsync vsync) => YgRadioStyle(
        controller: _statesController,
        vsync: vsync,
      ),
      getWatchedProperties: (YgRadioStyle style) => <Listenable>{
        style.mouseCursor,
      },
      builder: (BuildContext context, YgRadioStyle style) {
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
                mouseCursor: style.mouseCursor.value,
                enabled: widget._enabled,
                child: Padding(
                  padding: EdgeInsets.all(context.radioTheme.padding),
                  child: CustomPaint(
                    size: Size.square(style.radioSize.value),
                    painter: _YgRadioPainter(
                      style: style,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onShowFocusHighlight(bool value) {
    _statesController.update(YgRadioState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    _statesController.update(YgRadioState.hovered, value);
  }

  void _onTap() {
    final ValueChanged<T?>? onChanged = widget.onChanged;
    if (onChanged != null) {
      onChanged(widget.value);
    }
  }
}

class _YgRadioPainter extends CustomPainter {
  _YgRadioPainter({
    required this.style,
  }) : super(repaint: style);

  final YgRadioStyle style;

  @override
  void paint(Canvas canvas, Size objectSize) {
    final Paint backgroundPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = style.backgroundColor.value;

    final Paint handlerPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = style.handleColor.value;

    final Paint helperHandlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = style.helperHandleColor.value;

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      style.radioSize.value / 2.0,
      backgroundPaint,
    );

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      style.handleSize.value / 2.0,
      handlerPaint,
    );

    canvas.drawCircle(
      Offset(objectSize.width / 2.0, objectSize.height / 2.0),
      style.helperHandleSize.value / 2.0,
      helperHandlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _YgRadioPainter oldDelegate) {
    return style != oldDelegate.style;
  }
}
