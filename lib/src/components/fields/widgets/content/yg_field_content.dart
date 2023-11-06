import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/widgets/content/yg_field_content_style.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../../yg_field_state.dart';

/// The content of the [YgTextField].
///
/// Renders and animates the value text, label and placeholder.
class YgFieldContent extends StatefulWidget {
  const YgFieldContent({
    super.key,
    required this.value,
    required this.placeholder,
    required this.label,
    required this.state,
    required this.minLines,
    required this.floatLabelOnFocus,
  });

  /// The value.
  ///
  /// This is simply a widget with a [DefaultTextStyle] provided to it, any
  /// interaction logic of the value (if required) will be implemented elsewhere.
  final Widget value;

  /// The placeholder.
  ///
  /// Only shown if [state] does not contain the [YgFieldState.filled].
  final String? placeholder;

  /// The label.
  ///
  /// Will be in place of the value if there is no [placeholder] and when
  /// [state] does not contain [YgFieldState.filled], [YgFieldState.focused] or
  /// [YgFieldState.opened].
  final String label;

  /// The current state of the field.
  final YgFieldState state;

  /// The minium height of the value in an amount of lines.
  ///
  /// Only effects the height of the widget.
  final int? minLines;

  /// Whether the label should float up if the widget gets focused.
  final bool floatLabelOnFocus;

  @override
  State<YgFieldContent> createState() => _YgFieldContentState();
}

class _YgFieldContentState extends StateWithYgStyle<YgFieldContent, YgFieldContentStyle> {
  final UniqueKey _valueKey = UniqueKey();
  final UniqueKey _placeholderKey = UniqueKey();
  final UniqueKey _labelKey = UniqueKey();

  @override
  YgFieldContentStyle createStyle() {
    return YgFieldContentStyle(
      floatLabelOnFocus: widget.floatLabelOnFocus,
      state: widget.state,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.state.filled,
      builder: (BuildContext context, Widget? child) {
        final String? placeholder = widget.placeholder;
        final double labelFloatingHeight = style.labelFloatingHeight;
        final YgFieldState state = widget.state;

        return Stack(
          children: <Widget>[
            if (placeholder != null && !state.filled.value)
              Padding(
                key: _placeholderKey,
                padding: EdgeInsets.only(top: labelFloatingHeight),
                child: DefaultTextStyleTransition(
                  style: style.placeholderTextStyle,
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
                style: style.valueTextStyle,
                child: widget.value,
              ),
            ),
            SlideTransition(
              key: _labelKey,
              position: style.labelOffset,
              child: DefaultTextStyleTransition(
                style: style.labelTextStyle,
                child: Text(
                  widget.label,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
