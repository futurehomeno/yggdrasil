import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ScrollableDropdownTestScreen extends StatelessWidget {
  const ScrollableDropdownTestScreen({super.key});

  static const String routeName = 'ScrollableDropdownTestScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ScrollableDropdownTestScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'ScrollableDropdownTest',
      scrollable: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1000),
          child: Center(child: RepaintSelf()),
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _shown = false;

  @override
  Widget build(BuildContext context) {
    return RepaintSelf();
  }
}

class RepaintSelf extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RepaintSelfRenderer(
      gestureSettings: MediaQuery.gestureSettingsOf(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RepaintSelfRenderer renderObject) {
    renderObject.gestureSettings = MediaQuery.gestureSettingsOf(context);
  }
}

class RepaintSelfRenderer extends RenderBox {
  RepaintSelfRenderer({
    DeviceGestureSettings? gestureSettings,
  }) {
    _tap = TapGestureRecognizer()
      ..onTap = _onTap
      ..gestureSettings = gestureSettings;
  }

  final _random = Random();
  late final TapGestureRecognizer _tap;

  DeviceGestureSettings? get gestureSettings => _tap.gestureSettings;
  set gestureSettings(DeviceGestureSettings? gestureSettings) {
    _tap.gestureSettings = gestureSettings;
  }

  void _onTap() {
    markNeedsPaint();
  }

  @override
  void performLayout() {
    size = constraints.constrain(
      Size(
        100,
        100,
      ),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()
      ..color = Color.fromARGB(
        255,
        (_random.nextDouble() * 255).toInt(),
        (_random.nextDouble() * 255).toInt(),
        (_random.nextDouble() * 255).toInt(),
      );

    context.canvas.drawRect(offset & size, paint);
  }

  @override
  bool get isRepaintBoundary => false;

  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      _tap.addPointer(event);
    }
  }

  @override
  void dispose() {
    _tap.dispose();
    super.dispose();
  }

  @override
  bool hitTestSelf(Offset position) => true;
}
