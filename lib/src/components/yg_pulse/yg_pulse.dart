import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Widget that animates three circles in a pulsating pattern.
class YgPulse extends LeafRenderObjectWidget {
  const YgPulse({
    super.key,
    required this.enabled,
  });

  /// Whether new pulses should be added.
  final bool enabled;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _YgPulseRenderer(
      theme: context.pulseTheme,
      enabled: enabled,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void updateRenderObject(BuildContext context, covariant _YgPulseRenderer renderObject) {
    renderObject.theme = context.pulseTheme;
    renderObject.enabled = enabled;
  }
}

class _YgPulseRenderer extends RenderBox with YgRenderObjectDebugPainterMixin {
  _YgPulseRenderer({
    required this.theme,
    required bool enabled,
  }) : _enabled = enabled {
    if (enabled) {
      _pulses.add(SchedulerBinding.instance.currentFrameTimeStamp);
      _scheduleFrame();
    }
  }

  YgPulseTheme theme;

  // Prevent the repaint from moving up the widget tree.
  @override
  final bool isRepaintBoundary = true;

  /// Timestamps of when all the currently rendered pulses where added.
  final List<Duration> _pulses = <Duration>[];

  /// The id of the currently scheduled frame callback.
  int? _frameCallbackId;

  /// Whether the pulse was enabled in the last frame.
  bool _enabledInLastFrame = false;

  bool _enabled;
  bool get enabled => _enabled;
  set enabled(bool newEnabled) {
    if (_enabled != newEnabled) {
      _enabled = newEnabled;
      if (newEnabled && _frameCallbackId == null) {
        _scheduleFrame();
      }
    }
  }

  @override
  void detach() {
    final int? frameCallbackId = _frameCallbackId;
    if (frameCallbackId != null) {
      SchedulerBinding.instance.cancelFrameCallbackWithId(frameCallbackId);
    }

    super.detach();
  }

  void _onFrame(Duration timestamp) {
    _frameCallbackId = null;

    // Remove all pulses that have completed.
    _pulses.removeWhere((Duration pulse) {
      return (timestamp - pulse).inMilliseconds / theme.pulseDuration.inMilliseconds > 1;
    });

    if (_enabled) {
      final Duration? lastPulse = _pulses.lastOrNull;
      // If the last pulse was longer ago than the pulse interval add new pulse.
      if (lastPulse == null || lastPulse <= timestamp - theme.pulseInterval) {
        // If the pulse was enabled in the last frame we can assume the last
        // pulse expired in between the current and last frame.
        if (_enabledInLastFrame && lastPulse != null) {
          /// Ensure the new pulse is shown exactly 1 second later.
          _pulses.add(lastPulse + theme.pulseInterval);
        } else {
          _pulses.add(timestamp);
        }
      }
    }

    if (_pulses.isNotEmpty) {
      _scheduleFrame();
    }

    _enabledInLastFrame = _enabled;
    markNeedsPaint();
  }

  void _scheduleFrame() {
    _frameCallbackId = SchedulerBinding.instance.scheduleFrameCallback(_onFrame);
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
        final double linearProgress = (timestamp - pulse).inMilliseconds / pulseDurationMs;
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
