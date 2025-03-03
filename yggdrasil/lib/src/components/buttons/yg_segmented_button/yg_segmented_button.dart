part of buttons;

/// A button which is made up out of multiple [YgButtonSegment]s.
abstract class YgSegmentedButton<T extends Object?> extends StatelessWidget with StatelessWidgetDebugMixin {
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
          side: theme.borderSide.copyWith(
            width: theme.borderSide.width * 2,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: theme.borderRadius,
        ),
        color: theme.borderSide.color,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: segments
              .map(
                (YgButtonSegment<T> segment) => Flexible(
                  child: _YgSegmentedButtonSegment(
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

  @override
  YgDebugType get debugType => YgDebugType.intractable;
}
