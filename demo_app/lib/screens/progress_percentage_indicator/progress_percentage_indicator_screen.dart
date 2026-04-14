import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/_core.dart';
import 'package:yggdrasil_demo/widgets/_widgets.dart';

class ProgressPercentageIndicatorScreen extends StatefulWidget {
  const ProgressPercentageIndicatorScreen({super.key});

  static const String routeName = 'ProgressPercentageIndicatorScreen';

  static PageRouteBuilder<Widget> route() {
    return const YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const ProgressPercentageIndicatorScreen(),
    );
  }

  @override
  State<ProgressPercentageIndicatorScreen> createState() => _ProgressPercentageIndicatorScreenState();
}

class _ProgressPercentageIndicatorScreenState extends State<ProgressPercentageIndicatorScreen> {
  double _animatedPercentage = 0.0;
  Timer? _timer;

  double _devicePercentage = 0.0;
  Timer? _deviceTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startSimulation();
    _startDeviceSimulation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _deviceTimer?.cancel();
    super.dispose();
  }

  void _startSimulation() {
    _timer?.cancel();
    _animatedPercentage = 0.0;
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      setState(() {
        _animatedPercentage += 0.005;
        if (_animatedPercentage >= 1.0) {
          _animatedPercentage = 0.0;
        }
      });
    });
  }

  void _startDeviceSimulation() {
    _deviceTimer?.cancel();
    _devicePercentage = 0.0;
    _scheduleNextDeviceUpdate();
  }

  void _scheduleNextDeviceUpdate() {
    final int delaySeconds = 10 + _random.nextInt(11); // 10–20 seconds
    _deviceTimer = Timer(Duration(seconds: delaySeconds), () {
      if (!mounted) return;
      setState(() {
        _devicePercentage += 0.05 + _random.nextDouble() * 0.1; // +5–15%
        if (_devicePercentage >= 1.0) {
          _devicePercentage = 0.0;
        }
      });
      _scheduleNextDeviceUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final int remainingSeconds = ((1.0 - _animatedPercentage) * 90).round();
    final int totalMB = 212;
    final int uploadedMB = (_animatedPercentage * totalMB).round();

    final int deviceRemainingSeconds = ((1.0 - _devicePercentage) * 180).round();
    final int deviceTotalMB = 512;
    final int deviceUploadedMB = (_devicePercentage * deviceTotalMB).round();

    return DemoScreen(
      componentName: 'ProgressPercentageIndicator',
      child: YgLayoutBody(
        child: Column(
          children: <Widget>[
            YgSection(
              title: 'Device update simulation',
              subtitle: 'Updates every 10–20 sec',
              child: YgProgressPercentageIndicator(
                percentage: _devicePercentage,
                timeRemaining: '~$deviceRemainingSeconds sec',
                remainingSubtitle: 'remaining',
                title: 'Firmware update',
                subtitle: '$deviceUploadedMB of $deviceTotalMB packages',
              ),
            ),
            const YgSection(
              title: 'Static - 67%',
              subtitle: 'With title and subtitle.',
              child: YgProgressPercentageIndicator(
                percentage: 0.67,
                timeRemaining: '~59 sec',
                remainingSubtitle: 'remaining',
                title: 'Uploading files',
                subtitle: '142 of 212 MB',
              ),
            ),
            const YgSection(
              title: 'Static - 25%',
              subtitle: 'Early progress.',
              child: YgProgressPercentageIndicator(
                percentage: 0.25,
                timeRemaining: '~3 min',
                remainingSubtitle: 'remaining',
                title: 'Downloading update',
                subtitle: '64 of 256 MB',
              ),
            ),
            const YgSection(
              title: 'Static - 90%',
              subtitle: 'Almost complete.',
              child: YgProgressPercentageIndicator(
                percentage: 0.9,
                timeRemaining: '~10 sec',
                remainingSubtitle: 'remaining',
                title: 'Processing data',
                subtitle: '900 of 1000 items',
              ),
            ),
            const YgSection(
              title: 'Without title & subtitle',
              subtitle: 'Minimal variant.',
              child: YgProgressPercentageIndicator(
                percentage: 0.5,
                timeRemaining: '~2 min',
                remainingSubtitle: 'remaining',
              ),
            ),
            const YgSection(
              title: 'Animation disabled',
              subtitle: 'isAnimated: false — no shimmer overlay.',
              child: YgProgressPercentageIndicator(
                percentage: 0.45,
                timeRemaining: '~1 min',
                remainingSubtitle: 'remaining',
                title: 'Syncing',
                subtitle: '45 of 100 files',
                isAnimated: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
