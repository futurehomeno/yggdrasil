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
            value: 0.25,
            onChanged: (_) {},
          ),
          const YgSection(
            title: 'Temperature slider',
            child: YgSlider(
              value: 0.25,
              variant: YgSliderVariant.temperature,
              valueIndicator: true,
            ),
          ),
          const YgSection(
            title: 'Temperature slider with difference indicator',
            child: YgSlider(
              value: 0.25,
              variant: YgSliderVariant.temperature,
              differenceIndicator: true,
              valueIndicator: true,
            ),
          ),
          const YgSection(
            title: 'Temperature slider with difference value',
            child: YgSlider(
              value: 0.25,
              currentValue: 0.5,
              variant: YgSliderVariant.temperature,
              differenceIndicator: true,
              valueIndicator: true,
            ),
          ),
          const YgSection(
            title: 'Shades slider',
            child: YgSlider(
              value: 0.25,
              variant: YgSliderVariant.shades,
              valueIndicator: true,
            ),
          ),
          const YgSection(
            title: 'Shades slider with difference indicator',
            child: YgSlider(
              value: 0.25,
              variant: YgSliderVariant.shades,
              differenceIndicator: true,
              valueIndicator: true,
            ),
          ),
          const YgSection(
            title: 'Shades slider with difference value',
            child: YgSlider(
              value: 0.25,
              currentValue: 0.5,
              variant: YgSliderVariant.shades,
              differenceIndicator: true,
              valueIndicator: true,
            ),
          ),
        ],
      ),
    );
  }
}
