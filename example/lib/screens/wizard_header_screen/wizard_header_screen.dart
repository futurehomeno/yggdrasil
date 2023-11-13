// ignore_for_file: prefer-single-widget-per-file

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class WizardHeaderScreen extends StatelessWidget {
  const WizardHeaderScreen({super.key});

  static const String routeName = 'WizardHeaderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const WizardHeaderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const DemoScreen(
      componentName: 'WizardHeader',
      child: YgSection.list(
        children: <Widget>[
          YgWizardHeader(
            step: 1,
            steps: 5,
          ),
        ],
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class YgWizardHeader extends StatefulWidget {
  const YgWizardHeader({
    super.key,
    required this.steps,
    required this.step,
  });

  final int steps;
  final int step;

  @override
  State<YgWizardHeader> createState() => _YgWizardHeaderState();
}

class _YgWizardHeaderState extends State<YgWizardHeader> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    value: _value,
    vsync: this,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgWizardHeader oldWidget) {
    final double newValue = _value;
    if (oldWidget.steps != widget.step) {
      controller.value *= oldWidget.steps / widget.steps;
    }

    if (controller.value != newValue) {
      controller.animateTo(
        newValue,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  double get _value => (widget.step - 1) / (widget.steps - 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.tokens.colors.backgroundDefault,
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 4,
                  child: CustomPaint(
                    painter: WizardProgressPainter(
                      steps: widget.steps,
                      value: controller,
                      stroke: 4,
                      padding: 5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text('Step ${widget.step} of ${widget.steps}'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Wizard title',
            style: context.tokens.textStyles.sectionHeading2Medium,
          ),
        ],
      ),
    );
  }
}

class WizardProgressPainter extends CustomPainter {
  WizardProgressPainter({
    required this.value,
    required this.steps,
    required this.stroke,
    required this.padding,
  }) : super(repaint: value);

  final Animation<double> value;
  final int steps;
  final double stroke;
  final double padding;

  static final Paint _backgroundPaint = Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  static final Paint _foregroundPaint = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final int correctedSteps = steps - 1;
    final double halfStroke = stroke / 2;
    final double stepWidth = (size.width - correctedSteps * padding) / steps;
    final Path path = Path();

    for (int i = 0; i < steps; i++) {
      final double offset = i * (stepWidth + padding);
      final double length = offset + stepWidth;

      final Offset start = Offset(offset + halfStroke, halfStroke);
      final Offset end = Offset(length - halfStroke, halfStroke);

      path.addLineOutline(start, end, stroke);
    }

    final double relativeValue = (value.value * correctedSteps + 1) / steps;
    final Offset start = Offset(halfStroke, halfStroke);
    final Offset backgroundEnd = Offset(size.width - halfStroke, halfStroke);
    final Offset valueEnd = Offset(size.width * relativeValue - halfStroke, halfStroke);

    canvas.clipPath(path);
    canvas.drawLine(start, backgroundEnd, _backgroundPaint);
    canvas.drawLine(start, valueEnd, _foregroundPaint);
  }

  @override
  bool shouldRepaint(WizardProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WizardProgressPainter oldDelegate) => false;
}

extension PathAddArcOutlineExtension on Path {
  /// Adds the outline of a arc with rounded end caps to the path.
  ///
  /// Accepts [strokeWidth] to specify the width of the line of the arc of which
  /// the outline is drawn.
  void addLineOutline(
    Offset p1,
    Offset p2,
    double strokeWidth,
  ) {
    final double angle = p1.angleTo(p2) + (pi / 2);
    final double halfStroke = strokeWidth / 2;
    final Offset start = p1.translateWithAngle(angle, halfStroke);

    // Move to start.
    moveTo(
      start.dx,
      start.dy,
    );

    // Start cap.
    arcTo(
      Rect.fromCircle(
        center: p1,
        radius: halfStroke,
      ),
      angle,
      pi,
      false,
    );

    // End cap.
    arcTo(
      Rect.fromCircle(
        center: p2,
        radius: halfStroke,
      ),
      angle + pi,
      pi,
      false,
    );

    // Close path.
    close();
  }
}

extension OffsetExtension on Offset {
  double angleTo(Offset other) => atan2(other.dy - dy, other.dx - dx);

  Offset translateWithAngle(double angle, double distance) {
    return Offset(
      dx + distance * cos(angle),
      dy + distance * sin(angle),
    );
  }
}
