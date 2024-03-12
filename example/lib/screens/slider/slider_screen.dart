import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

  static const String routeName = 'SliderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SliderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Slider',
      child: Column(
        children: <Widget>[
          Slider(
            value: 0.5,
            onChanged: (_) {},
          ),
          const YgSlider(
            value: 0.5,
            currentValue: 1,
            variant: YgSliderVariant.temperature,
          ),
        ],
      ),
    );
  }
}
