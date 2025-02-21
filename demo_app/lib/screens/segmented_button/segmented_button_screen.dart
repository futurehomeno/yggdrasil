import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class SegmentedButtonScreen extends StatefulWidget {
  const SegmentedButtonScreen({super.key});

  static const String routeName = 'SegmentedButtonScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const SegmentedButtonScreen(),
    );
  }

  @override
  State<SegmentedButtonScreen> createState() => _SegmentedButtonScreenState();
}

class _SegmentedButtonScreenState extends State<SegmentedButtonScreen> {
  List<int> segmentCountValues = <int>[0, 0, 0, 0];
  int onlyLabelsValue = 0;
  int onlyIconsValue = 0;
  int labelsIconsValue = 0;
  Set<int> multiSelectValue = <int>{};

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'SegmentedButton',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection(
              title: 'Segmented button with only labels',
              child: YgSegmentedButton<int>(
                segments: _getSegments(count: 3, label: true),
                value: onlyLabelsValue,
                onValueChanged: (int newValue) => setState(() => onlyLabelsValue = newValue),
              ),
            ),
            YgSection(
              title: 'Segmented button with only icons',
              child: YgSegmentedButton<int>(
                segments: _getSegments(count: 3, icon: true),
                value: onlyIconsValue,
                onValueChanged: (int newValue) => setState(() => onlyIconsValue = newValue),
              ),
            ),
            YgSection(
              title: 'Segmented button with icons and labels',
              child: YgSegmentedButton<int>(
                segments: _getSegments(count: 3, icon: true, label: true),
                value: labelsIconsValue,
                onValueChanged: (int newValue) => setState(() => labelsIconsValue = newValue),
              ),
            ),
            YgSection(
              title: 'Disabled segmented button',
              child: YgSegmentedButton<int>(
                segments: _getSegments(count: 3, label: true),
                value: 0,
                onValueChanged: null,
              ),
            ),
            YgSection(
              title: 'Multi select segmented button',
              child: YgSegmentedButton<int>.multiSelect(
                segments: _getSegments(count: 3, label: true),
                value: multiSelectValue,
                onValueChanged: (Set<int> newValue) => setState(() => multiSelectValue = newValue),
              ),
            ),
            YgSection.column(
              title: 'Possible amounts of segments',
              children: List<Widget>.generate(
                4,
                (int index) => YgSegmentedButton<int>(
                  segments: _getSegments(count: index + 2, label: true),
                  value: segmentCountValues[index],
                  onValueChanged: (int newValue) => setState(() => segmentCountValues[index] = newValue),
                ),
              ).withVerticalSpacing(20),
            ),
          ],
        ),
      ),
    );
  }

  List<YgButtonSegment<int>> _getSegments({
    bool icon = false,
    bool label = false,
    int count = 2,
  }) {
    final List<YgColorableIconData> colorableIcons = YgIcons.allIcons.whereType<YgColorableIconData>().toList();

    return List<YgButtonSegment<int>>.generate(
      count,
      (int index) => switch (label) {
        true => YgButtonSegment<int>(
            icon: icon ? colorableIcons[index] : null,
            label: 'Item ${index + 1}',
            value: index,
          ),
        false => YgButtonSegment<int>.iconOnly(
            icon: colorableIcons[index],
            value: index,
          ),
      },
    );
  }
}
