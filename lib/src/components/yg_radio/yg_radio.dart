import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_radio_painter.dart';
import 'yg_radio_state.dart';
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
    this.hasError = false,
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
  final ValueChanged<T>? onChanged;

  /// When true visually shows the user there is an error.
  final bool hasError;

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

class _YgRadioState<T> extends StateWithYgStyle<YgRadio<T>, YgRadioStyle> {
  late final YgRadioState _state = YgRadioState(
    disabled: !widget._enabled,
    selected: widget._selected,
    error: widget.hasError,
  );

  @override
  void didUpdateWidget(covariant YgRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    _state.disabled.value = !widget._enabled;
    _state.selected.value = widget._selected;
    _state.error.value = widget.hasError;
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  YgRadioStyle createStyle() {
    return YgRadioStyle(
      state: _state,
      vsync: this,
    );
  }

  @override
  Set<Listenable> getWatchedProperties() {
    return <Listenable>{
      style.mouseCursor,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      checked: widget._selected,
      child: YgFocusableActionDetector(
        mouseCursor: style.mouseCursor.value,
        enabled: widget._enabled,
        onActivate: _onTap,
        onFocusChanged: _state.focused.update,
        onHoverChanged: _state.hovered.update,
        child: Padding(
          padding: EdgeInsets.all(context.radioTheme.padding),
          child: RepaintBoundary(
            child: CustomPaint(
              size: Size.square(style.radioSize.value),
              painter: YgRadioPainter(
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    widget.onChanged?.call(widget.value);
  }
}
