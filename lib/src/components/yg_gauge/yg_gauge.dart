import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Arc-style gauge that goes from 0.0 to 1.0.
///
/// This version of the gauge is responsive, but should
/// only be used from around 90px to 120px and not inside
/// widgets that are larger / smaller than that.
// TODO(reza): Define larger / smaller version of this component.
class YgGauge extends StatelessWidget {
  const YgGauge({
    super.key,
    required this.value,
    this.gradient,
    this.trackColor,
    this.title,
    this.label,
    this.notation,
    this.icon,
  })  : assert(icon == null || notation == null, 'Cannot have both icon and notation'),
        assert(title == null || label == null || icon == null, 'Cannot have both title and label or icon'),
        assert(value == null || value >= 0.0 && value <= 1.0, 'Value must be between 0.0 and 1.0');

  /// Current value of the gauge from 0.0 to 1.0.
  ///
  /// Null is treated as 0.0 but also renders the gauge as disabled.
  final double? value;

  /// Gradient to use in the gauge.
  final Gradient? gradient;

  /// Color of the track (behind the gradient).
  final Color? trackColor;

  final String? title;
  final String? label;
  final String? notation;
  final YgIcon? icon;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return TweenAnimationBuilder<double>(
              duration: context.gaugeTheme.tweenDuration,
              tween: Tween<double>(begin: 0.0, end: value ?? 0.0),
              curve: context.gaugeTheme.tweenCurve,
              builder: (BuildContext context, double value, Widget? child) {
                return CustomPaint(
                  painter: _YgGaugePainter(
                    value: value,
                    gradient: gradient ?? _getDefaultGradient(context),
                    trackColor: trackColor ?? _getDefaultTrackColor(context),
                  ),
                  child: _buildChild(context, constraints),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildChild(BuildContext context, BoxConstraints constraints) {
    final double topPaddingWithNotation = constraints.maxHeight / 100 * 30;
    final double topPaddingWithoutNotation = constraints.maxHeight / 100 * 35;
    final double bottomPadding = constraints.maxHeight / 100 * 10;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: notation != null ? topPaddingWithNotation : topPaddingWithoutNotation),
            child: Column(
              children: <Widget>[
                if (icon != null && title == null) _buildIcon(context),
                if (title != null) _buildTitle(context),
                if (notation != null) _buildNotation(context),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (icon != null && label == null && (title != null && label != null)) _buildIcon(context),
                if (label != null) _buildLabel(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // TODO(developer): Remove test style height after updating tokens.
  Text _buildTitle(BuildContext context) {
    return Text(
      title!,
      style: context.gaugeTheme.titleTextStyle.copyWith(
        height: 24 / 20,
        color: _disabled ? context.tokens.colors.textDisabled : null,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }

  Text _buildNotation(BuildContext context) {
    return Text(
      notation!,
      style: context.gaugeTheme.notationTextStyle.copyWith(
        color: _disabled ? context.tokens.colors.textDisabled : null,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label!,
      style: context.gaugeTheme.labelTextStyle.copyWith(
        color: _disabled ? context.tokens.colors.textDisabled : null,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }

  Widget _buildIcon(BuildContext context) {
    return IconTheme.merge(
      data: IconThemeData(
        color: _disabled ? context.tokens.colors.iconDisabled : context.tokens.colors.iconDefault,
      ),
      child: icon!,
    );
  }

  /// Default gradient - color of the gauge.
  ///
  /// The gradient is rotated 90 degrees so that it "starts"
  /// at the bottom instead of the right.
  Gradient _getDefaultGradient(BuildContext context) {
    return SweepGradient(
      colors: <Color>[
        context.tokens.colors.borderSuccessWeak,
        context.tokens.colors.borderWarningWeak,
        context.tokens.colors.borderCriticalDefault,
      ],
      stops: const <double>[
        45 / 360,
        180 / 360,
        315 / 360,
      ],
      transform: const GradientRotation(math.pi / 2),
    );
  }

  /// Default track color.
  Color _getDefaultTrackColor(BuildContext context) {
    return context.tokens.colors.backgroundDisabled;
  }

  bool get _disabled => value == null;
}

class _YgGaugePainter extends CustomPainter {
  _YgGaugePainter({
    required this.value,
    required this.gradient,
    required this.trackColor,
  });

  final double value;
  final Gradient gradient;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Stroke width is calculated based on the width of the gauge
    // multiplied by a factor, by default 100 / 9, meaning 9px
    // at 100px width.
    const double strokeWidthFactor = 100 / 9;
    final double responsiveStrokeWidth = size.width / strokeWidthFactor;

    // Padding is calculated assuming it should be 5px at 100px width.
    const double paddingFactor = 100 / 5;
    final double responsivePadding = size.width / paddingFactor;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: (size.width - responsiveStrokeWidth) / 2 - responsivePadding,
    );

    // The start of which to dra the arc.
    const double startAngle = math.pi * 2 * 25 / 64;

    // The end of which to draw the arc.
    const double endAngle = math.pi * 2 * 46 / 64;

    final Paint trackPainter = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = responsiveStrokeWidth
      ..strokeCap = StrokeCap.round;

    final Paint arcPainter = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = responsiveStrokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      endAngle,
      false,
      trackPainter,
    );

    canvas.drawArc(
      rect,
      startAngle,
      endAngle * value,
      false,
      arcPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
