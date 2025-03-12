import 'dart:collection';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/models/bar_segment.dart';

final class BarSegmentTween extends Tween<BarSegment> with LinkedListEntry<BarSegmentTween> {
  BarSegmentTween({
    required this.variant,
    super.begin,
    super.end,
  });

  final DataVariant variant;

  @override
  BarSegment lerp(double t) {
    return BarSegment(
      variant: variant,
      value: lerpDouble(begin?.value ?? 0, end?.value ?? 0, t)!,
    );
  }
}
