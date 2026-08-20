import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class StateTimelineScreen extends StatefulWidget {
  const StateTimelineScreen({super.key});

  static const String routeName = 'StateTimelineScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const StateTimelineScreen(),
    );
  }

  @override
  State<StateTimelineScreen> createState() => _StateTimelineScreenState();
}

class _StateTimelineScreenState extends State<StateTimelineScreen> {
  static const List<String> _dayLabels = <String>['00:00', '06:00', '12:00', '18:00', '24:00'];
  static const List<String> _hvacStates = <String>['Heat', 'Cool', 'Fan', 'Idle'];

  final Random _random = Random();

  late List<YgStateTimelineSeries> _hvacDay = _randomHvacDay();

  @override
  Widget build(BuildContext context) {
    return DemoScreen(
      componentName: 'StateTimeline',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection.column(
              title: 'Thermostat states over a day',
              children: <Widget>[
                YgStateTimeline(
                  series: _hvacDay,
                  start: 0.0,
                  end: 24.0,
                  axisLabels: _dayLabels,
                ),
                YgButton(
                  onPressed: () => setState(() => _hvacDay = _randomHvacDay()),
                  child: const Text('Randomize data'),
                ),
              ],
            ),
            const YgSection(
              title: 'Gaps show the track (device offline)',
              child: YgStateTimeline(
                series: <YgStateTimelineSeries>[
                  YgStateTimelineSeries(
                    id: 'boost',
                    label: 'Boost',
                    ranges: <YgStateTimelineRange>[
                      YgStateTimelineRange(start: 7.0, end: 9.0),
                      YgStateTimelineRange(start: 19.0, end: 20.0),
                    ],
                  ),
                  YgStateTimelineSeries(
                    id: 'eco',
                    label: 'Eco',
                    ranges: <YgStateTimelineRange>[
                      YgStateTimelineRange(start: 12.0, end: 14.0),
                    ],
                  ),
                ],
                start: 0.0,
                end: 24.0,
                axisLabels: _dayLabels,
              ),
            ),
            const YgSection(
              title: 'Thicker bar with explicit colors, no legend',
              child: YgStateTimeline(
                series: <YgStateTimelineSeries>[
                  YgStateTimelineSeries(
                    id: 'on',
                    label: 'On',
                    color: Color(0xff02a8f1),
                    ranges: <YgStateTimelineRange>[
                      YgStateTimelineRange(start: 2.0, end: 9.0),
                      YgStateTimelineRange(start: 15.0, end: 21.0),
                    ],
                  ),
                  YgStateTimelineSeries(
                    id: 'off',
                    label: 'Off',
                    color: Color(0xfff9470b),
                    ranges: <YgStateTimelineRange>[
                      YgStateTimelineRange(start: 9.0, end: 15.0),
                    ],
                  ),
                ],
                start: 0.0,
                end: 24.0,
                size: YgStateTimelineSize.medium,
                showLegend: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A random contiguous segmentation of the day over the HVAC states.
  List<YgStateTimelineSeries> _randomHvacDay() {
    final Map<String, List<YgStateTimelineRange>> rangesPerState = <String, List<YgStateTimelineRange>>{
      for (final String state in _hvacStates) state: <YgStateTimelineRange>[],
    };

    double time = 0.0;
    while (time < 24.0) {
      final double duration = 1.0 + _random.nextDouble() * 5.0;
      final String state = _hvacStates[_random.nextInt(_hvacStates.length)];
      rangesPerState[state]!.add(
        YgStateTimelineRange(start: time, end: min(24.0, time + duration)),
      );
      time += duration;
    }

    return <YgStateTimelineSeries>[
      for (final String state in _hvacStates)
        YgStateTimelineSeries(
          id: state.toLowerCase(),
          label: state,
          ranges: rangesPerState[state]!,
        ),
    ];
  }
}
