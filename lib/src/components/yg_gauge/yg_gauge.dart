import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Arc-style gauge.
///
/// This version of the gauge is responsive, but should
/// only be used from around 90px to 120px and not inside
/// widgets that are larger / smaller than that.
// TODO(reza): Define larger / smaller version of this component.
class YgGauge extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgGauge({
    super.key,
    required this.value,
    this.minValue = 0.0,
    this.maxValue = 1.0,
    this.title,
    this.buildTitle,
    this.label,
    this.notation,
    this.icon,
  })  : assert(title == null || buildTitle == null, 'title and buildTitle can not be both defined.'),
        assert(minValue <= maxValue, 'minValue must be less than or equal to maxValue'),
        assert(icon == null || notation == null, 'Cannot have both icon and notation'),
        assert(title == null || label == null || icon == null, 'Cannot have both title and label or icon');

  /// Current value of the gauge.
  ///
  /// Null is treated as 0.0 but also renders the gauge as disabled.
  final double? value;

  /// The minimum value of the gauge.
  final double minValue;

  /// The maximum value of the gauge.
  final double maxValue;

  /// Text shown in the center of the gauge.
  ///
  /// When the title depends on the value use [buildTitle] instead.
  final String? title;

  /// A builder which uses the current value to generate a title.
  ///
  /// When the title is state use [title] instead.
  final String Function(double value)? buildTitle;

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
    begin: widget.value ?? 0.0,
    end: widget.value ?? 0.0,
  );
  late final Animation<double> _animation = _controller.drive(_tween);

  @override
  void didUpdateWidget(covariant YgGauge oldWidget) {
    if (widget.value != oldWidget.value) {
      _tween.begin = _animation.value;
      _tween.end = widget.value;
      _controller.value = 0.0;

      final YgGaugeTheme theme = context.gaugeTheme;

      _controller.animateTo(
        1.0,
        curve: theme.tweenCurve,
        duration: theme.tweenDuration,
      );
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
                minValue: widget.minValue,
                maxValue: widget.maxValue,
                gradient: _getDefaultGradient(context),
                trackColor: _getDefaultTrackColor(context),
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

    final String? title = widget.title;
    final String Function(double value)? buildTitle = widget.buildTitle;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: widget.notation != null ? topPaddingWithNotation : topPaddingWithoutNotation),
            child: Column(
              children: <Widget>[
                if (widget.icon != null && widget.title == null) _buildIcon(context),
                if (title != null) _buildTitle(context, title),
                if (buildTitle != null) _buildAnimatedTitle(context),
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
  Widget _buildAnimatedTitle(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, _) => _buildTitle(
        context,
        widget.buildTitle!(_animation.value),
      ),
    );
  }

  Text _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.gaugeTheme.titleTextStyle.copyWith(
        height: 24.0 / 20.0,
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
        45.0 / 360.0,
        180.0 / 360.0,
        315.0 / 360.0,
      ],
      transform: const GradientRotation(math.pi / 2.0),
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
    required this.minValue,
    required this.maxValue,
    required this.gradient,
    required this.trackColor,
    required this.animation,
  }) : super(repaint: animation);

  final double minValue;
  final double maxValue;
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
      endAngle * ((animation.value - minValue) / (maxValue - minValue)),
      false,
      arcPainter,
    );
  }

  @override
  bool shouldRepaint(covariant _YgGaugePainter oldDelegate) {
    return oldDelegate.gradient != gradient || oldDelegate.trackColor != trackColor;
  }
}
