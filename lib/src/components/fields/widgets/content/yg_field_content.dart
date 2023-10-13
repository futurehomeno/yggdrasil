import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_field_state.dart';
import 'package:yggdrasil/src/components/fields/widgets/content/yg_field_content_style.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The content of the [YgTextField].
///
/// Renders and animates the value text, label and placeholder.
class YgFieldContent extends StatefulWidget {
  const YgFieldContent({
    super.key,
    required this.value,
    required this.placeholder,
    required this.label,
    required this.statesController,
    required this.minLines,
  });

  /// The value.
  ///
  /// This is simply a widget with a [DefaultTextStyle] provided to it, any
  /// interaction logic of the value (if required) will be implemented elsewhere.
  final Widget value;

  /// The placeholder.
  ///
  /// Only shown if [statesController] does not contain the [YgFieldState.filled].
  final String? placeholder;

  /// The label.
  ///
  /// Will be in place of the value if there is no [placeholder] and when
  /// [statesController] does not contain [YgFieldState.filled], [YgFieldState.focused] or
  /// [YgFieldState.opened].
  final String label;

  /// The current states of the field.
  final YgStatesController<YgFieldState> statesController;

  /// The minium height of the value in an amount of lines.
  ///
  /// Only effects the height of the widget.
  final int? minLines;

  @override
  State<YgFieldContent> createState() => _YgFieldContentState();
}

class _YgFieldContentState extends State<YgFieldContent> with TickerProviderStateMixin, YgUpdateMixin {
  final UniqueKey _valueKey = UniqueKey();
  final UniqueKey _placeholderKey = UniqueKey();
  final UniqueKey _labelKey = UniqueKey();

  late final YgFieldContentStyle _style = YgFieldContentStyle(
    controller: widget.statesController,
    vsync: this,
  );

  @override
  void dispose() {
    _style.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? placeholder = widget.placeholder;
    final double labelFloatingHeight = _style.labelFloatingHeight;
    final Set<YgFieldState> states = widget.statesController.states;

    return Stack(
      children: <Widget>[
        if (placeholder != null && !states.contains(YgFieldState.filled))
          Padding(
            key: _placeholderKey,
            padding: EdgeInsets.only(top: labelFloatingHeight),
            child: DefaultTextStyleTransition(
              style: _style.placeholderTextStyle,
              child: Text(
                placeholder,
                maxLines: widget.minLines ?? 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        Padding(
          key: _valueKey,
          padding: EdgeInsets.only(top: labelFloatingHeight),
          child: DefaultTextStyleTransition(
            style: _style.valueTextStyle,
            child: widget.value,
          ),
        ),
        SlideTransition(
          key: _labelKey,
          position: _style.labelOffset,
          child: DefaultTextStyleTransition(
            style: _style.labelTextStyle,
            child: Text(
              widget.label,
            ),
          ),
        ),
      ],
    );
  }
}
