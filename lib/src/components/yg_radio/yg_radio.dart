import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_radio/yg_radio.style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgRadio<T> extends StatefulWidget {
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

  bool get enabled => onChanged != null;

  bool get selected => value == groupValue;

  @override
  State<YgRadio<T>> createState() => _YgRadioState<T>();
}

class _YgRadioState<T> extends State<YgRadio<T>> {
  MaterialStatesController? internalStatesController;

  // region StatesController
  void handleStatesControllerChange() {
    // Force a rebuild to resolve MaterialStateProperty properties.
    setState(() {});
  }

  MaterialStatesController get statesController => internalStatesController!;

  void initStatesController() {
    internalStatesController = MaterialStatesController();
    statesController.update(MaterialState.disabled, !widget.enabled);
    statesController.update(MaterialState.selected, widget.selected);
    statesController.addListener(handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  @override
  void didUpdateWidget(covariant YgRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selected != oldWidget.selected) {
      statesController.update(MaterialState.selected, widget.selected);
    }

    if (widget.enabled != oldWidget.enabled) {
      statesController.update(MaterialState.disabled, !widget.enabled);
      if (!widget.enabled) {
        // The radio may have been disabled while a press gesture is currently underway.
        statesController.update(MaterialState.pressed, false);
      }
    }
  }

  @override
  void dispose() {
    statesController.removeListener(handleStatesControllerChange);
    super.dispose();
  }
  // endregion StatesController

  @override
  Widget build(BuildContext context) {
    final YgRadioStyle radioStyle = YgRadioStyle.base(context);
    final Color? resolvedBackgroundColor = radioStyle.backgroundColor.resolve(statesController.value);
    final Color? resolvedHandleColor = radioStyle.handleColor.resolve(statesController.value);
    final double? resolvedSize = radioStyle.size.resolve(statesController.value);
    final double? resolvedHandleSize = radioStyle.handleSize.resolve(statesController.value);
    final double? resolvedHelperHandleSize = radioStyle.helperHandleSize.resolve(statesController.value);

    return RepaintBoundary(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onChanged == null ? null : _onTap,
        child: FocusableActionDetector(
          onShowHoverHighlight: _onShowHoverHighlight,
          onShowFocusHighlight: _onShowFocusHighlight,
          child: Padding(
            padding: EdgeInsets.all(context.radioTheme.padding),
            child: InkWell(
              child: AnimatedContainer(
                duration: context.radioTheme.animationDuration,
                width: resolvedSize,
                height: resolvedSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: resolvedBackgroundColor,
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: context.radioTheme.animationDuration,
                    width: resolvedHandleSize,
                    height: resolvedHandleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: resolvedHandleColor,
                    ),
                    child: Center(
                      child: AnimatedContainer(
                        duration: context.radioTheme.animationDuration,
                        width: resolvedHelperHandleSize,
                        height: resolvedHelperHandleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.radioTheme.helperHandleColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onShowFocusHighlight(bool value) {
    statesController.update(MaterialState.focused, value);
  }

  void _onShowHoverHighlight(bool value) {
    statesController.update(MaterialState.hovered, value);
  }

  void _onTap() {
    widget.onChanged!(widget.value);
  }
}
