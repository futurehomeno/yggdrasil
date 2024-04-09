import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_callout/yg_callout_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// The implementation of the Yggdrasil callout.
class YgCallout extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgCallout({
    super.key,
    required this.description,
    this.variant = YgCalloutVariant.highlight,
    this.title,
    this.textLink,
    this.onClose,
  });

  /// The description shown in the callout.
  final String description;

  /// The variant of the callout.
  ///
  /// Primarily changes the color.
  final YgCalloutVariant variant;

  /// The title of the callout.
  final String? title;

  /// The optional text link.
  ///
  /// Often used to link to additional information related to the callout.
  final YgTextLink? textLink;

  /// Called when the user clicks the close button.
  ///
  /// Close button only exists if this callback is provided.
  /// The callout does not hide itself, it has to be removed from the widget tree
  /// manually when this callback is called.
  final VoidCallback? onClose;

  @override
  State<YgCallout> createState() => _YgCalloutState();
}

class _YgCalloutState extends StateWithYgStateAndStyle<YgCallout, YgCalloutState, YgCalloutStyle> {
  @override
  YgCalloutState createState() {
    return YgCalloutState(
      variant: widget.variant,
    );
  }

  @override
  YgCalloutStyle createStyle() {
    return YgCalloutStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.variant;
  }

  @override
  Widget build(BuildContext context) {
    final YgCalloutTheme theme = context.calloutTheme;
    final YgTextLink? textLink = widget.textLink;
    final String? title = widget.title;

    return YgAnimatedPhysicalShape(
      color: style.backgroundColor,
      shape: style.borderColor.map(
        (Color value) => RoundedRectangleBorder(
          borderRadius: theme.borderRadius,
          side: BorderSide(
            color: value,
          ),
        ),
      ),
      child: Padding(
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null) _buildTitle(theme, title),
                  _buildDescription(theme),
                  if (textLink != null) _buildTextLink(theme, textLink),
                ],
              ),
            ),
            if (widget.onClose != null) _buildCloseButton(),
          ].withHorizontalSpacing(theme.closeButtonSpacing),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return YgIconButton(
      onPressed: widget.onClose,
      size: YgIconButtonSize.small,
      icon: YgIcons.cross,
    );
  }

  Widget _buildTitle(YgCalloutTheme theme, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: theme.titleSpacing),
      child: Text(
        title,
        style: theme.titleTextStyle,
      ),
    );
  }

  Widget _buildTextLink(YgCalloutTheme theme, YgTextLink textLink) {
    return Padding(
      padding: EdgeInsets.only(top: theme.linkSpacing),
      child: textLink,
    );
  }

  Widget _buildDescription(YgCalloutTheme theme) {
    return Text(
      widget.description,
      style: theme.descriptionTextStyle,
    );
  }
}
