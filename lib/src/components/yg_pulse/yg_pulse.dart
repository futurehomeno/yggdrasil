import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgPulse extends LeafRenderObjectWidget {
  const YgPulse({
    super.key,
    required this.enabled,
  });

  final bool enabled;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return YgPulseRenderer(
      theme: context.pulseTheme,
      enabled: enabled,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant YgPulseRenderer renderObject) {
    renderObject.theme = context.pulseTheme;
    renderObject.enabled = enabled;
  }
}

class YgPulseRenderer extends RenderBox with YgRenderObjectDebugPainterMixin {
  YgPulseRenderer({
    required this.theme,
    required bool enabled,
  }) : _enabled = enabled {
    if (enabled) {
      _addPulse(SchedulerBinding.instance.currentFrameTimeStamp);
      _scheduleFrame();
    }
  }

  @override
  final bool isRepaintBoundary = true;
  YgPulseTheme theme;
  final List<Duration> _pulses = <Duration>[];
  Duration? _lastPulse;
  bool _frameScheduled = false;
  bool _enabledInLastFrame = false;

  bool _enabled;
  bool get enabled => _enabled;
  set enabled(bool newEnabled) {
    if (_enabled != newEnabled) {
      _enabled = newEnabled;
      if (newEnabled && !_frameScheduled) {
        _scheduleFrame();
      }
    }
  }

  void _onFrame(Duration timestamp) {
    // Remove all pulses that have completed.
    _pulses.removeWhere((Duration pulse) {
      final Duration timeSincePulseAdded = timestamp - pulse;
      final double progress = timeSincePulseAdded.inMilliseconds / theme.pulseDuration.inMilliseconds;

      return progress > 1;
    });

    if (_enabled) {
      final Duration? lastPulse = _lastPulse;
      // If the last pulse was longer ago than the pulse interval add new pulse.
      if (lastPulse == null || lastPulse <= timestamp - theme.pulseInterval) {
        // If the pulse was enabled in the last frame we can assume the last
        // pulse expired in between the current and last frame.
        if (_enabledInLastFrame && lastPulse != null) {
          /// Ensure the new pulse is shown exactly 1 second later.
          _addPulse(lastPulse + theme.pulseInterval);
        } else {
          _addPulse(timestamp);
        }
      }
    }

    _frameScheduled = _pulses.isNotEmpty;
    if (_frameScheduled) {
      _scheduleFrame();
    }

    _enabledInLastFrame = _enabled;
    markNeedsPaint();
  }

  void _scheduleFrame() {
    SchedulerBinding.instance.scheduleFrameCallback(_onFrame);
  }

  void _addPulse(Duration timestamp) {
    _lastPulse = timestamp;
    _pulses.add(timestamp);
  }

  @override
  void performLayout() {
    size = constraints.constrain(
      theme.preferredSize,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (_pulses.isNotEmpty) {
      final Duration timestamp = SchedulerBinding.instance.currentFrameTimeStamp;
      final int pulseDurationMs = theme.pulseDuration.inMilliseconds;
      for (final Duration pulse in _pulses) {
        final int timeSincePulseAddedMs = (timestamp - pulse).inMilliseconds;
        final double linearProgress = timeSincePulseAddedMs / pulseDurationMs;

        // Should not happen, but just in case skin rendering if progress is to high.
        if (linearProgress > 1) {
          continue;
        }

        final double progress = theme.pulseCurve.transform(linearProgress);
        final double inverseProgress = 1 - progress;

        final Paint paint = Paint()..color = theme.backgroundColor.withOpacity(inverseProgress);
        final Offset center = Offset(size.width, size.height) * inverseProgress / 2;

        context.canvas.drawOval(
          (offset + center) & size * progress,
          paint,
        );
      }
    }

    super.paint(context, offset);
  }
}
