import 'dart:collection';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:yggdrasil/src/components/yg_chart/enums/data_variant.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/models/bar_segment.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/models/segmented_bar.dart';
import 'package:yggdrasil/src/components/yg_chart/painters/plotting/segmented_bar_chart/tweens/bar_segment_tween.dart';
import 'package:yggdrasil/src/extensions/list_extension.dart';

class SegmentedBarTween extends Tween<SegmentedBar> {
  SegmentedBarTween({
    required super.begin,
    required super.end,
  }) {
    final SegmentedBar? begin = this.begin;
    final SegmentedBar? end = this.end;

    if (begin == null && end == null) {
      return;
    }

    if (end != null && begin == null) {
      segmentTweens = <BarSegmentTween>[];
      for (final BarSegment segment in end.segments) {
        segmentTweens.add(
          BarSegmentTween(
            variant: segment.variant,
            end: segment,
          ),
        );
      }

      return;
    }

    if (begin != null && end == null) {
      segmentTweens = <BarSegmentTween>[];
      for (final BarSegment segment in begin.segments) {
        segmentTweens.add(
          BarSegmentTween(
            variant: segment.variant,
            begin: segment,
          ),
        );
      }

      return;
    }

    // Extract variants from begin and end segments
    final List<DataVariant> beginVariants = begin!.segments.map((BarSegment s) => s.variant).toList();
    final List<DataVariant> endVariants = end!.segments.map((BarSegment s) => s.variant).toList();

    // Find longest common subsequence of variants
    final List<DataVariant> commonVariants = beginVariants.longestCommonSublist(endVariants);

    // Create LinkedList for all tweens and a separate list to track common ones
    final LinkedList<BarSegmentTween> linkedList = LinkedList<BarSegmentTween>();
    final List<BarSegmentTween> commonInterpolators = <BarSegmentTween>[];

    // Create tweens for common variants
    for (final DataVariant variant in commonVariants) {
      final BarSegmentTween entry = BarSegmentTween(variant: variant);
      linkedList.add(entry);
      commonInterpolators.add(entry);
    }

    for (int i = 0, j = 0; i < begin.segments.length; i++) {
      final BarSegment segment = begin.segments[i];
      if (j < commonInterpolators.length) {
        final BarSegmentTween next = commonInterpolators[j];

        if (next.variant == segment.variant) {
          j++;
          next.begin = segment;
        } else {
          final BarSegmentTween entry = BarSegmentTween(
            variant: segment.variant,
            begin: segment,
            end: BarSegment(
              value: 0,
              variant: segment.variant,
            ),
          );
          next.insertBefore(entry);
        }
      } else {
        linkedList.add(BarSegmentTween(
          begin: segment,
          end: BarSegment(
            value: 0,
            variant: segment.variant,
          ),
          variant: segment.variant,
        ));
      }
    }

    for (int i = 0, j = 0; i < end.segments.length; i++) {
      final BarSegment segment = end.segments[i];
      if (j < commonInterpolators.length) {
        final BarSegmentTween next = commonInterpolators[j];

        if (next.variant == segment.variant) {
          j++;
          next.end = segment;
        } else {
          final BarSegmentTween entry = BarSegmentTween(
            variant: segment.variant,
            begin: BarSegment(
              value: 0,
              variant: segment.variant,
            ),
            end: segment,
          );
          next.insertBefore(entry);
        }
      } else {
        linkedList.add(BarSegmentTween(
          begin: BarSegment(
            value: 0,
            variant: segment.variant,
          ),
          end: segment,
          variant: segment.variant,
        ));
      }
    }

    segmentTweens = linkedList.toList();
  }

  late final List<BarSegmentTween> segmentTweens;

  @override
  SegmentedBar lerp(double t) {
    return SegmentedBar(
      value: lerpDouble(
        begin?.value.end ?? 0,
        end?.value.end ?? 0,
        t,
      )!,
      index: begin!.index,
      segments: <BarSegment>[
        for (final BarSegmentTween tween in segmentTweens) tween.transform(t),
      ],
    );
  }
}
