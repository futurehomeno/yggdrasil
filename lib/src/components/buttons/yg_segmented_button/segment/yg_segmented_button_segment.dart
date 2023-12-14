import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base.dart';
import 'package:yggdrasil/src/components/buttons/widgets/yg_button_base_style.dart';
import 'package:yggdrasil/src/components/buttons/yg_segmented_button/segment/yg_segmented_button_segment_state.dart';
import 'package:yggdrasil/src/components/buttons/yg_segmented_button/segment/yg_segmented_button_segment_style.dart';
import 'package:yggdrasil/src/theme/segmented_button/segmented_button_theme.dart';
import 'package:yggdrasil/src/utils/yg_states/interfaces/yg_vsync.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSegmentedButtonSegment extends YgButtonBase<YgSegmentedButtonSegmentState> {
  const YgSegmentedButtonSegment({
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

  final bool selected;
  final String? label;
  final YgIcon? icon;

  @override
  Widget buildChild(BuildContext context) {
    final YgSegmentedButtonTheme theme = context.segmentedButtonTheme;
    final Widget? content = _buildContent();
    final bool showLeading = selected || (icon != null && label != null);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          widthFactor: showLeading ? 1 : 0,
          alignment: Alignment.center,
          child: AnimatedOpacity(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            opacity: showLeading ? 1 : 0,
            child: Padding(
              padding: EdgeInsets.only(right: theme.childSpacing),
              child: _buildLeading(),
            ),
          ),
        ),
        if (content != null) content,
      ],
    );
  }

  Widget _buildLeading() {
    final YgIcon? icon = this.icon;
    if (icon == null || label == null) {
      return const YgIcon(YgIcons.check);
    }

    return AnimatedCrossFade(
      firstChild: const YgIcon(YgIcons.check),
      secondChild: icon,
      duration: const Duration(milliseconds: 200),
      firstCurve: Curves.easeInOut,
      secondCurve: Curves.easeInOut,
      crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget? _buildContent() {
    final String? label = this.label;
    if (label == null) {
      return icon;
    }

    return Text(label);
  }

  @override
  YgSegmentedButtonSegmentState createButtonState() {
    return YgSegmentedButtonSegmentState(
      disabled: disabled,
      selected: selected,
    );
  }

  @override
  YgButtonBaseStyle<YgSegmentedButtonSegmentState> createStyle(YgVsync vsync, YgSegmentedButtonSegmentState state) {
    return YgSegmentedButtonSegmentStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  void updateState(YgSegmentedButtonSegmentState state) {
    state.selected.value = selected;
    state.disabled.value = disabled;
  }
}
