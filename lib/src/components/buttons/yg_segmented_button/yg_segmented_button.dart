import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/segmented_button/segmented_button_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'segment/_segment.dart';

part 'yg_segmented_button_multi_select.dart';
part 'yg_segmented_button_single_select.dart';

/// A button which is made up out of multiple [YgButtonSegment]s.
abstract class YgSegmentedButton<T extends Object?> extends StatelessWidget {
  const factory YgSegmentedButton({
    Key? key,
    required ValueChanged<T>? onValueChanged,
    required List<YgButtonSegment<T>> segments,
    required T value,
  }) = _YgSegmentedButtonSingleSelect<T>;

  /// A segmented button that allows for multiple values to be selected at once.
  const factory YgSegmentedButton.multiSelect({
    Key? key,
    required ValueChanged<Set<T>>? onValueChanged,
    required List<YgButtonSegment<T>> segments,
    required Set<T> value,
  }) = _YgSegmentedButtonMultiSelect<T>;

  const YgSegmentedButton._({
    super.key,
    required this.segments,
  });

  /// The segments of this segmented button.
  final List<YgButtonSegment<T>> segments;

  @override
  Widget build(BuildContext context) {
    final YgSegmentedButtonTheme theme = context.segmentedButtonTheme;

    assert(
      segments.length >= 2 && segments.length <= 5,
      'Can not have more than 5 or less than 2 segments.',
    );

    return RepaintBoundary(
      child: Material(
        shape: RoundedRectangleBorder(
          side: theme.borderSide,
          borderRadius: theme.borderRadius,
        ),
        color: theme.borderSide.color,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: segments
              .map(
                (YgButtonSegment<T> segment) => Flexible(
                  child: YgSegmentedButtonSegment(
                    onPressed: _disabled ? null : () => _onSegmentPressed(segment),
                    selected: _isSegmentSelected(segment),
                    label: segment.label,
                    icon: segment.icon,
                  ),
                ),
              )
              .toList()
              .withHorizontalSpacing(theme.borderSide.width),
        ),
      ),
    );
  }

  bool _isSegmentSelected(YgButtonSegment<T> segment);

  void _onSegmentPressed(YgButtonSegment<T> segment);

  bool get _disabled;
}
