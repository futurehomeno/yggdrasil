import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_checkbox_painter.dart';
import 'yg_checkbox_style.dart';

part 'yg_checkbox_dual_state.dart';
part 'yg_checkbox_tri_state.dart';

/// Yggdrasil checkbox button.
abstract class YgCheckbox extends StatefulWidget with StatefulWidgetDebugMixin implements YgToggleable {
  const factory YgCheckbox({
    bool hasError,
    Key? key,
    required ValueChanged<bool>? onChanged,
    required bool value,
  }) = YgCheckboxDualState;

  /// Supports a nullable value "indeterminate".
  const factory YgCheckbox.triState({
    bool hasError,
    Key? key,
    required ValueChanged<bool?>? onChanged,
    required bool? value,
  }) = YgCheckboxTriState;

  const YgCheckbox._({
    super.key,
    this.hasError = false,
  });

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

class _YgCheckboxState extends StateWithYgStyle<YgCheckbox, YgCheckboxStyle> {
  late final YgCheckboxState _state = YgCheckboxState(
    checked: widget.value,
    disabled: widget.disabled,
    error: widget.hasError,
  );

  @override
  YgCheckboxStyle createStyle() {
    return YgCheckboxStyle(
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
  void didUpdateWidget(covariant YgCheckbox oldWidget) {
    _state.checked.value = widget.value;
    _state.disabled.value = widget.disabled;
    _state.error.value = widget.hasError;
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
      onActivate: widget.toggle,
      onFocusChanged: _state.focused.update,
      onHoverChanged: _state.hovered.update,
      enabled: !_state.disabled.value,
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
