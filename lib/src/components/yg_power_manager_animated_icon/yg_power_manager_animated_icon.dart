import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_power_manager_animated_icon_style.dart';
import 'yg_power_manager_animated_icon_variant.dart';

class YgPowerManagerAnimatedIcon extends StatefulWidget {
  const YgPowerManagerAnimatedIcon({
    super.key,
    required this.variant,
  });

  final YgPowerMangerAnimatedIconVariant variant;

  @override
  State<YgPowerManagerAnimatedIcon> createState() => _YgPowerManagerAnimatedIconState();
}

class _YgPowerManagerAnimatedIconState extends StateWithYgStateAndStyle<YgPowerManagerAnimatedIcon,
    YgPowerManagerAnimatedIconState, YgPowerManagerAnimatedIconStyle> {
  late final AnimationController _topArrowController = AnimationController(
    vsync: this,
    lowerBound: -1,
    upperBound: 1,
  );

  late final AnimationController _bottomArrowController = AnimationController(
    vsync: this,
    lowerBound: -1,
    upperBound: 1,
  );

  void animateIncrease() async {
    _bottomArrowController.value = 0;
    _topArrowController.value = 0;
    await Future.any(<TickerFuture>[
      _bottomArrowController.animateTo(
        0.1172,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
      _topArrowController.animateTo(
        0.0584,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    ]);
    await Future.any(<TickerFuture>[
      _bottomArrowController.animateTo(
        0.1172,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
      _topArrowController.animateTo(
        0.0584,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _topArrowController.animateTo(1.0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _topArrowController.dispose();
    _bottomArrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateIncrease,
      child: CustomPaint(
        painter: YgPowerManagerAnimatedIconPainter(
          style: style,
          topArrowOffset: _topArrowController,
          bottomArrowOffset: _bottomArrowController,
        ),
        size: const Size.square(25),
      ),
    );
  }

  @override
  YgPowerManagerAnimatedIconState createState() {
    return YgPowerManagerAnimatedIconState(
      variant: widget.variant,
    );
  }

  @override
  YgPowerManagerAnimatedIconStyle createStyle() {
    return YgPowerManagerAnimatedIconStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.variant;
  }
}

class YgPowerManagerAnimatedIconPainter extends CustomPainter {
  YgPowerManagerAnimatedIconPainter({
    required Animation<double> topArrowOffset,
    required Animation<double> bottomArrowOffset,
    required YgPowerManagerAnimatedIconStyle style,
  })  : _topArrowOffset = topArrowOffset,
        _bottomArrowOffset = bottomArrowOffset,
        _style = style,
        super(
          repaint: Listenable.merge(
            <Listenable?>[
              topArrowOffset,
              bottomArrowOffset,
              style,
            ],
          ),
        );

  final Animation<double> _topArrowOffset;
  final Animation<double> _bottomArrowOffset;
  final YgPowerManagerAnimatedIconStyle _style;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = _style.color.value
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final Path topArrow = ArrowPainter.createPath(
      Offset(4, 7 + (_topArrowOffset.value * size.height)),
      _style.variant.value,
    );
    final Path bottomArrow = ArrowPainter.createPath(
      Offset(4, 13 + (_bottomArrowOffset.value * size.height)),
      _style.variant.value,
    );

    canvas.drawPath(topArrow, paint);
    canvas.drawPath(bottomArrow, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ArrowPainter {
  static const List<Offset> _p1 = <Offset>[Offset(0, 8), Offset(0, 0)];
  static const List<Offset> _p2 = <Offset>[Offset(8.5, 0), Offset(8.5, 8)];
  static const List<Offset> _p3 = <Offset>[Offset(17, 8), Offset(17, 0)];

  static Path createPath(Offset offset, double t) {
    final Offset p1 = offset + Offset.lerp(_p1[0], _p1[1], t)!;
    final Offset p2 = offset + Offset.lerp(_p2[0], _p2[1], t)!;
    final Offset p3 = offset + Offset.lerp(_p3[0], _p3[1], t)!;

    return Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy);
  }
}
