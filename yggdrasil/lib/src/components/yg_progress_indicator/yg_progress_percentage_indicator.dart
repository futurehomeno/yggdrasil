import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Displays a progress percentage with a [LinearProgressIndicator],
/// time remaining, and an optional animated shimmer overlay.
class YgProgressPercentageIndicator extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgProgressPercentageIndicator({
    super.key,
    required this.percentage,
    required this.timeRemaining,
    required this.remainingSubtitle,
    this.title,
    this.subtitle,
    this.isAnimated = true,
  });

  /// Current progress value in range of 0.0 to 1.0.
  final double percentage;

  /// Text describing the remaining time, e.g. "~59 sec".
  final String timeRemaining;

  /// Label shown below [timeRemaining], e.g. "remaining".
  final String remainingSubtitle;

  /// Optional title shown above the percentage, e.g. "Uploading files".
  final String? title;

  /// Optional subtitle shown below the progress bar, e.g. "142 of 212 MB".
  final String? subtitle;

  /// Whether the shimmer overlay animation is active.
  final bool isAnimated;

  @override
  State<YgProgressPercentageIndicator> createState() => _YgProgressPercentageIndicatorState();
}

class _YgProgressPercentageIndicatorState extends State<YgProgressPercentageIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    if (widget.isAnimated) {
      _shimmerController.repeat();
    }
  }

  @override
  void didUpdateWidget(YgProgressPercentageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimated != oldWidget.isAnimated) {
      if (widget.isAnimated) {
        _shimmerController.repeat();
      } else {
        _shimmerController.stop();
      }
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProgressPercentageIndicatorTheme theme = context.progressIndicatorTheme.progressPercentageIndicatorTheme;
    final LinearProgressIndicatorTheme linearTheme = context.progressIndicatorTheme.linearProgressIndicatorTheme;

    final String? title = widget.title;
    final String? subtitle = widget.subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: theme.contentSpacing),
            child: Text(title, style: theme.titleTextStyle),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '${(widget.percentage * 100).round()} %',
              style: theme.percentageTextStyle,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(widget.timeRemaining, style: theme.timeRemainingTextStyle),
                Text(widget.remainingSubtitle, style: theme.remainingSubtitleTextStyle),
              ],
            ),
          ],
        ),
        SizedBox(height: theme.contentSpacing),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(end: widget.percentage),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          builder: (BuildContext context, double animatedValue, Widget? child) {
            return ClipRRect(
              borderRadius: linearTheme.borderRadius,
              child: SizedBox(
                height: theme.progressBarHeight,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: RepaintBoundary(
                        child: LinearProgressIndicator(
                          value: animatedValue,
                          color: linearTheme.color,
                          backgroundColor: linearTheme.backgroundColor,
                        ),
                      ),
                    ),
                    if (widget.isAnimated)
                      Positioned.fill(
                        child: _ShimmerOverlay(
                          controller: _shimmerController,
                          percentage: animatedValue,
                          shimmerColor: theme.shimmerColor,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        if (subtitle != null)
          Padding(
            padding: EdgeInsets.only(top: theme.contentSpacing),
            child: Text(subtitle, style: theme.subtitleTextStyle),
          ),
      ],
    );
  }
}

class _ShimmerOverlay extends LeafRenderObjectWidget {
  const _ShimmerOverlay({
    required this.controller,
    required this.percentage,
    required this.shimmerColor,
  });

  final AnimationController controller;
  final double percentage;
  final Color shimmerColor;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _ShimmerRenderBox(
      controller: controller,
      percentage: percentage,
      shimmerColor: shimmerColor,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant _ShimmerRenderBox renderObject) {
    renderObject
      ..percentage = percentage
      ..shimmerColor = shimmerColor;
  }
}

class _ShimmerRenderBox extends RenderBox {
  _ShimmerRenderBox({
    required AnimationController controller,
    required double percentage,
    required Color shimmerColor,
  }) : _controller = controller,
       _percentage = percentage,
       _shimmerColor = shimmerColor;

  final AnimationController _controller;

  double _percentage;
  set percentage(double value) {
    if (_percentage != value) {
      _percentage = value;
      markNeedsPaint();
    }
  }

  Color _shimmerColor;
  set shimmerColor(Color value) {
    if (_shimmerColor != value) {
      _shimmerColor = value;
      markNeedsPaint();
    }
  }

  @override
  bool get isRepaintBoundary => true;

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    _controller.addListener(markNeedsPaint);
  }

  @override
  void detach() {
    _controller.removeListener(markNeedsPaint);
    super.detach();
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }

  static const double _shimmerWidthRatio = 0.4;

  @override
  void paint(PaintingContext context, Offset offset) {
    final double filledWidth = size.width * _percentage.clamp(0.0, 1.0);
    if (filledWidth <= 0) return;

    final double animValue = _controller.value;

    // The shimmer band travels from left edge to right edge of the filled area.
    // We extend the travel range so the band fully enters and exits.
    final double bandWidth = filledWidth * _shimmerWidthRatio;
    final double travelDistance = filledWidth + bandWidth;
    final double bandCenter = -bandWidth / 2 + travelDistance * animValue;

    final double bandStart = bandCenter - bandWidth / 2;
    final double bandEnd = bandCenter + bandWidth / 2;

    // Clamp drawing to the filled region.
    final double drawStart = bandStart.clamp(0.0, filledWidth);
    final double drawEnd = bandEnd.clamp(0.0, filledWidth);
    if (drawEnd <= drawStart) return;

    final Rect shimmerRect = Rect.fromLTWH(
      offset.dx + drawStart,
      offset.dy,
      drawEnd - drawStart,
      size.height,
    );

    // Gradient stop positions relative to the full band.
    final double gradientStart = offset.dx + bandStart;
    final double gradientEnd = offset.dx + bandEnd;

    final Paint paint = Paint()
      ..shader =
          LinearGradient(
            colors: <Color>[
              _shimmerColor.withValues(alpha: 0),
              _shimmerColor,
              _shimmerColor,
              _shimmerColor.withValues(alpha: 0),
            ],
            stops: const <double>[0.0, 0.35, 0.65, 1.0],
          ).createShader(
            Rect.fromLTRB(gradientStart, offset.dy, gradientEnd, offset.dy + size.height),
          );

    context.canvas.drawRect(shimmerRect, paint);
  }
}
