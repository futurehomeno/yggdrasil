import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_checkbox_painter.dart';
import 'yg_checkbox_style.dart';

part 'yg_checkbox_dual_state.dart';
part 'yg_checkbox_tri_state.dart';

/// Yggdrasil checkbox.
abstract class YgCheckbox extends StatefulWidget with StatefulWidgetDebugMixin implements YgToggleable {
  const factory YgCheckbox({
    bool hasError,
    Key? key,
    required ValueChanged<bool>? onChanged,
    required bool? value,
  }) = YgCheckboxDualState;

  /// Supports a nullable value, i.e. "indeterminate".
  const factory YgCheckbox.triState({
    bool hasError,
    Key? key,
    required ValueChanged<bool?>? onChanged,
    required bool? value,
  }) = YgCheckboxTriState;

  const YgCheckbox._({
    super.key,
    this.hasError = false,
    this.value,
  });

  /// The current value of the checkbox.
  @override
  final bool? value;

  /// Whether the checkbox is in an error state.
  final bool hasError;

  @override
  State<YgCheckbox> createState() => _YgCheckboxState();

  @override
  YgDebugType get debugType {
    if (disabled) {
      return YgDebugType.other;
    }

    return YgDebugType.intractable;
  }
}

class _YgCheckboxState extends StateWithYgStateAndStyle<YgCheckbox, YgCheckboxState, YgCheckboxStyle> {
  @override
  YgCheckboxState createState() {
    return YgCheckboxState(
      checked: widget.value,
      disabled: widget.disabled,
      error: widget.hasError,
    );
  }

  @override
  void updateState() {
    state.checked.value = widget.value;
    state.disabled.value = widget.disabled;
    state.error.value = widget.hasError;
  }

  @override
  YgCheckboxStyle createStyle() {
    return YgCheckboxStyle(
      state: state,
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
    final YgCheckboxTheme theme = context.checkboxTheme;

    return YgFocusableActionDetector(
      onActivate: widget.toggle,
      onFocusChanged: state.focused.update,
      onHoverChanged: state.hovered.update,
      enabled: !state.disabled.value,
      mouseCursor: style.mouseCursor.value,
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
}
