import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Arc-style gauge that goes from 0.0 to 1.0.
///
/// This version of the gauge is responsive, but should
/// only be used from around 90px to 120px and not inside
/// widgets that are larger / smaller than that.
// TODO(reza): Define larger / smaller version of this component.
class YgGauge extends StatefulWidget {
  const YgGauge({
    super.key,
    required this.value,
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

  /// Color of the track (behind the gradient).
  final Color? trackColor;

  /// Text shown in the center of the gauge.
  final String? title;

  /// Text show on the bottom of the gauge.
  final String? label;

  /// Notation, usually kW, shown below the title.
  final String? notation;

  /// Icon shown either above the label or below the title.
  ///
  /// If title and icon are passed, the icon will be shown below the title.
  /// If label and icon are passed, the icon will be shown above the label.
  final YgIcon? icon;

  @override
  State<YgGauge> createState() => _YgGaugeState();
}

class _YgGaugeState extends State<YgGauge> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: context.gaugeTheme.tweenDuration,
  );
  late final Tween<double> _tween = Tween<double>(
    begin: widget.value ?? 0,
    end: widget.value ?? 0,
  );
  late final CurveTween _curveTween = CurveTween(
    curve: context.gaugeTheme.tweenCurve,
  );
  late final Animation<double> _animation = _controller.drive(_curveTween).drive(_tween);

  @override
  void didUpdateWidget(covariant YgGauge oldWidget) {
    if (widget.value != oldWidget.value) {
      _tween.begin = oldWidget.value;
      _tween.end = widget.value;
      _controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CustomPaint(
              painter: _YgGaugePainter(
                gradient: _getDefaultGradient(context),
                trackColor: widget.trackColor ?? _getDefaultTrackColor(context),
                animation: _animation,
              ),
              child: _buildContent(context, constraints),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, BoxConstraints constraints) {
    final double topPaddingWithNotation = constraints.maxHeight / 100 * 30;
    final double topPaddingWithoutNotation = constraints.maxHeight / 100 * 35;
    final double bottomPadding = constraints.maxHeight / 100 * 10;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: widget.notation != null ? topPaddingWithNotation : topPaddingWithoutNotation),
            child: Column(
              children: <Widget>[
                if (widget.icon != null && widget.title == null) _buildIcon(context),
                if (widget.title != null) _buildTitle(context),
                if (widget.notation != null) _buildNotation(context),
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
                if (widget.icon != null && widget.label == null && (widget.title != null && widget.label != null))
                  _buildIcon(context),
                if (widget.label != null) _buildLabel(context),
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
      widget.title!,
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
      widget.notation!,
      style: context.gaugeTheme.notationTextStyle.copyWith(
        color: _disabled ? context.tokens.colors.textDisabled : null,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      widget.label!,
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
      child: widget.icon!,
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

  bool get _disabled => widget.value == null;
}

class _YgGaugePainter extends CustomPainter {
  _YgGaugePainter({
    required this.gradient,
    required this.trackColor,
    required this.animation,
  }) : super(repaint: animation);

  final Animation<double> animation;
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
      endAngle * animation.value,
      false,
      arcPainter,
    );
  }

  @override
  bool shouldRepaint(covariant _YgGaugePainter oldDelegate) {
    return oldDelegate.gradient != gradient || oldDelegate.trackColor != trackColor;
  }
}
