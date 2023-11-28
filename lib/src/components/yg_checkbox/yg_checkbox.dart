import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'helpers/_helpers.dart';
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
          child: CustomPaint(
            painter: YgCheckboxPainter(
              style: style,
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

class YgCheckboxPainter extends CustomPainter {
  YgCheckboxPainter({
    required this.style,
  }) : super(repaint: style);

  final YgCheckboxStyle style;

  final Paint _borderPaint = Paint();
  final Paint _backgroundPaint = Paint();
  final Paint _iconPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double realSize = style.size.value;
    final double borderWidth = style.borderWidth.value;
    final BorderRadius borderRadius = style.borderRadius.value;

    final Rect rect = Rect.fromCenter(
      center: center,
      width: realSize,
      height: realSize,
    );

    final double borderToCenterFraction = style.borderToCenterFraction.value;
    final double distanceToMiddle = (realSize / 2) - borderWidth;
    final double deflation = distanceToMiddle * borderToCenterFraction;

    final RRect outerRRect = borderRadius.toRRect(rect);
    final RRect innerRRect = borderRadius.toRRect(rect.deflate(deflation)).deflate(borderWidth);

    _borderPaint.color = style.borderColor.value;
    _backgroundPaint.color = style.backgroundColor.value;
    _iconPaint.color = style.iconColor.value;

    canvas.drawRRect(outerRRect, _backgroundPaint);
    canvas.drawDRRect(outerRRect, innerRRect, _borderPaint);

    final Path iconPath = IconPathCreator.createPath(
      style.checkToMinusFraction.value,
      center,
    );

    canvas.drawPath(iconPath, _iconPaint);
  }

  @override
  bool shouldRepaint(covariant YgCheckboxPainter oldDelegate) => oldDelegate.style != style;
}

class IconPathCreator {
  static const Size iconSize = Size(8, 6);

  static const Offset checkP1 = Offset(0, 3);
  static const Offset checkP2 = Offset(3, 6);
  static const Offset checkP3 = Offset(8, 0);

  static const Offset lineP1 = Offset(0, 3);
  static const Offset lineP2 = Offset(3, 3);
  static const Offset lineP3 = Offset(8, 3);

  static Path createPath(double t, Offset center) {
    final Offset offset = Offset(
      center.dx - (iconSize.width / 2),
      center.dy - (iconSize.height / 2),
    );

    final Offset p1 = Offset.lerp(lineP1, checkP1, t)! + offset;
    final Offset p2 = Offset.lerp(lineP2, checkP2, t)! + offset;
    final Offset p3 = Offset.lerp(lineP3, checkP3, t)! + offset;

    final Path path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy);

    return path;
  }
}
