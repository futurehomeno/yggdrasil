import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  static const String routeName = 'SliderScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SliderScreen(),
    );
  }

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _defaultValue = 0.5;
  double _differenceIndicatorValue = 0.5;
  double _staticDifferenceIndicatorValue = 0.5;
  double _valueIndicatorValue = 50;
  double _customValueIndicator = 300;
  double _stepperValue = 0.5;
  double _customStepSizeValue = 22.5;
  double _temperatureValue1 = 0.5;
  double _temperatureValue2 = 0.5;
  double _shadesValue1 = 0.5;
  double _shadesValue2 = 0.5;

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'Slider',
      child: Column(
        children: <Widget>[
          YgSection(
            title: 'Default slider',
            child: YgSlider(
              value: _defaultValue,
              onEditingComplete: (double newValue) => setState(
                () => _defaultValue = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With value indicator',
            child: YgSlider(
              max: 100,
              value: _valueIndicatorValue,
              valueIndicator: true,
              onEditingComplete: (double newValue) => setState(
                () => _valueIndicatorValue = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With custom value indicator',
            child: YgSlider(
              max: 600,
              valueBuilder: _formatValueAsTime,
              value: _customValueIndicator,
              valueIndicator: true,
              onEditingComplete: (double newValue) => setState(
                () => _customValueIndicator = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With difference indicator',
            child: YgSlider(
              value: _differenceIndicatorValue,
              differenceIndicator: true,
              onEditingComplete: (double newValue) => setState(
                () => _differenceIndicatorValue = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With static difference indicator',
            child: YgSlider(
              value: _staticDifferenceIndicatorValue,
              currentValue: 0.25,
              differenceIndicator: true,
              onEditingComplete: (double newValue) => setState(
                () => _staticDifferenceIndicatorValue = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With custom step size',
            subtitle: 'Also with stepper buttons, difference and value indicator',
            child: YgSlider(
              value: _customStepSizeValue,
              differenceIndicator: true,
              valueIndicator: true,
              stepper: true,
              stepSize: 0.5,
              min: 10,
              max: 35,
              currentValue: 22.5,
              valueBuilder: (double value) => '${value.toStringAsFixed(1)}°',
              onEditingComplete: (double newValue) => setState(
                () => _customStepSizeValue = newValue,
              ),
            ),
          ),
          YgSection(
            title: 'With stepper buttons',
            subtitle: 'Also with difference and value indicator',
            child: YgSlider(
              value: _stepperValue,
              differenceIndicator: true,
              valueIndicator: true,
              stepper: true,
              max: 10,
              stepSize: 1,
              onEditingComplete: (double newValue) => setState(
                () => _stepperValue = newValue,
              ),
            ),
          ),
          YgSection.column(
            title: 'Temperature variant',
            subtitle: 'Both with a increasing and decreasing value',
            children: <Widget>[
              YgSlider(
                value: _temperatureValue1,
                variant: YgSliderVariant.temperature,
                valueIndicator: true,
                currentValue: 0.25,
                onEditingComplete: (double newValue) => setState(
                  () => _temperatureValue1 = newValue,
                ),
              ),
              YgSlider(
                value: _temperatureValue2,
                variant: YgSliderVariant.temperature,
                valueIndicator: true,
                currentValue: 0.75,
                onEditingComplete: (double newValue) => setState(
                  () => _temperatureValue2 = newValue,
                ),
              ),
            ].withVerticalSpacing(20.0),
          ),
          YgSection.column(
            title: 'Shades variant',
            subtitle: 'Both with a increasing and decreasing value',
            children: <Widget>[
              YgSlider(
                value: _shadesValue1,
                variant: YgSliderVariant.shades,
                valueIndicator: true,
                currentValue: 0.25,
                onEditingComplete: (double newValue) => setState(
                  () => _shadesValue1 = newValue,
                ),
              ),
              YgSlider(
                value: _shadesValue2,
                variant: YgSliderVariant.shades,
                valueIndicator: true,
                currentValue: 0.75,
                onEditingComplete: (double newValue) => setState(
                  () => _shadesValue2 = newValue,
                ),
              ),
            ].withVerticalSpacing(20.0),
          ),
          const YgSection(
            title: 'Disabled',
            child: YgSlider(
              value: 0.5,
              currentValue: 0.25,
              disabled: true,
            ),
          ),
        ],
      ),
    );
  }

  String _formatValueAsTime(double value) {
    final int totalSeconds = value.toInt();
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
