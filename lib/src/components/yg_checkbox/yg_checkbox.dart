import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'helpers/_helpers.dart';
import 'yg_checkbox_painter.dart';
import 'yg_checkbox_style.dart';

/// Yggdrasil checkbox button.
class YgCheckbox extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.triState = false,
    this.hasError = false,
  });

  /// The current value of the checkbox.
  final bool? value;

  /// Callback to trigger when the value of the checkbox changes.
  ///
  /// The checkbox itself does not maintain any state. Instead, when the state of
  /// the checkbox changes, the widget calls the [onChanged] callback.
  final ValueChanged<bool?>? onChanged;

  /// Enables `null` as a valid third state for the checkbox.
  ///
  /// The checkbox will then cycle through false --> null --> true --> false --> ...
  final bool triState;

  /// Whether the checkbox is in an error state.
  final bool hasError;

  @override
  State<YgCheckbox> createState() => _YgCheckboxState();

  @override
  YgDebugType get debugType {
    if (onChanged == null) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgCheckboxState extends StateWithYgStyle<YgCheckbox, YgCheckboxStyle> {
  late final YgCheckboxState _state = YgCheckboxState(
    checked: widget.value,
    disabled: widget.onChanged == null,
    error: widget.hasError,
    triState: widget.triState,
  );

  @override
  YgCheckboxStyle createStyle() {
    return YgCheckboxStyle(
      state: _state,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant YgCheckbox oldWidget) {
    _state.checked.value = widget.value;
    _state.disabled.value = widget.onChanged == null;
    _state.error.value = widget.hasError;
    _state.triState.value = widget.triState;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgCheckboxTheme theme = context.checkboxTheme;

    return YgFocusableActionDetector(
      onActivate: _onTap,
      onFocusChanged: _state.focused.update,
      onHoverChanged: _state.hovered.update,
      enabled: !_state.disabled.value,
      child: Padding(
        padding: theme.padding,
        child: SizedBox.square(
          dimension: theme.size,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: YgCheckboxPainter(
                style: style,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    final ValueChanged<bool>? onChanged = widget.onChanged;
    if (onChanged != null) {
      final bool? nextValue = YgCheckboxHelpers.getNextValue(widget.value, widget.triState);
      widget.onChanged?.call(nextValue);
    }
  }
}
