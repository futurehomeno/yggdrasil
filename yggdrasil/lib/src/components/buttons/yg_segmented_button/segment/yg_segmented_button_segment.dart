part of buttons;

/// A button segment, used internally for the [YgSegmentedButton].
class _YgSegmentedButtonSegment extends _YgButtonBase<_YgSegmentedButtonSegmentState> {
  const _YgSegmentedButtonSegment({
    super.key,
    required super.onPressed,
    required this.selected,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    this.label,
    this.icon,
  });

  /// Whether this segment is selected.
  final bool selected;

  /// The label shown in this segment.
  final String? label;

  /// The icon shown in this segment.
  final YgColorableIconData? icon;

  @override
  Widget buildChild(BuildContext context) {
    final YgSegmentedButtonTheme theme = context.segmentedButtonTheme;
    final Widget? content = _buildContent();
    final bool showLeading = selected || (icon != null && label != null);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedAlign(
          duration: theme.animationDuration,
          curve: theme.animationCurve,
          widthFactor: showLeading ? 1 : 0,
          alignment: Alignment.center,
          child: AnimatedOpacity(
            duration: theme.animationDuration,
            curve: theme.animationCurve,
            opacity: showLeading ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(right: theme.childSpacing),
              child: _buildLeading(theme),
            ),
          ),
        ),
        if (content != null)
          Flexible(
            child: content,
          ),
      ],
    );
  }

  Widget _buildLeading(YgSegmentedButtonTheme theme) {
    final YgColorableIconData? icon = this.icon;
    if (icon == null || label == null) {
      return const YgIcon(YgIcons.check);
    }

    return AnimatedCrossFade(
      firstChild: const YgIcon(YgIcons.check),
      secondChild: YgIcon(icon),
      duration: theme.animationDuration,
      firstCurve: theme.animationCurve,
      secondCurve: theme.animationCurve,
      crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget? _buildContent() {
    final String? label = this.label;
    final YgColorableIconData? icon = this.icon;
    if (label == null) {
      if (icon == null) {
        return null;
      }

      return YgIcon(icon);
    }

    return Text(label);
  }

  @override
  _YgSegmentedButtonSegmentState createButtonState() {
    return _YgSegmentedButtonSegmentState(
      disabled: disabled,
      selected: selected,
    );
  }

  @override
  _YgButtonBaseStyle<_YgSegmentedButtonSegmentState> createStyle(YgVsync vsync, _YgSegmentedButtonSegmentState state) {
    return _YgSegmentedButtonSegmentStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  void updateState(_YgSegmentedButtonSegmentState state) {
    state.selected.value = selected;
    state.disabled.value = disabled;
  }
}
