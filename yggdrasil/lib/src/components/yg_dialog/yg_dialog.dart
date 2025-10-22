import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_dialog/enums/yg_dialog_variant.dart';
import 'package:yggdrasil/src/components/yg_dialog/yg_dialog_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/theme/dialog/extensions/loading_dialog_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgDialog extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgDialog({
    super.key,
    required this.title,
    this.description,
    this.buttons,
    YgIcon this.icon = const YgIcon(YgIcons.supportBubble),
  }) : variant = YgDialogVariant.confirm;

  const YgDialog.success({
    super.key,
    required this.title,
    this.description,
    this.buttons,
  }) : variant = YgDialogVariant.success,
       icon = const YgIcon(YgIcons.check);

  const YgDialog.critical({
    super.key,
    required this.title,
    this.description,
    this.buttons,
  }) : variant = YgDialogVariant.critical,
       icon = const YgIcon(YgIcons.failed);

  const YgDialog.highlight({
    super.key,
    required this.title,
    this.description,
    this.buttons,
  }) : variant = YgDialogVariant.highlight,
       icon = const YgIcon(YgIcons.info);

  const YgDialog.loading({
    super.key,
    required this.title,
    this.description,
  }) : variant = YgDialogVariant.loading,
       icon = null,
       buttons = null;

  /// Title of the dialog.
  final String title;

  /// Description of the dialog.
  final String? description;

  /// Optional buttons that are displayed at the bottom of the dialog.
  ///
  /// For non-dismissible dialogs, with the exception of loading dialogs,
  /// the buttons are required and must allow the user to close the dialog.
  final YgButtonGroup? buttons;

  final YgIcon? icon;

  final YgDialogVariant variant;

  @override
  State<YgDialog> createState() => _YgDialogState();
}

class _YgDialogState extends StateWithYgStateAndStyle<YgDialog, YgDialogState, YgDialogStyle> {
  @override
  YgDialogState createState() {
    return YgDialogState(
      variant: widget.variant,
    );
  }

  @override
  YgDialogStyle createStyle() {
    return YgDialogStyle(
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
    final YgButtonGroup? ygButtonGroup = widget.buttons;
    final YgDialogTheme theme = context.dialogTheme;

    return Material(
      borderRadius: theme.outerBorderRadius,
      color: theme.backgroundColor,
      child: Padding(
        padding: theme.contentPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildHeader(theme),
            _buildTextSection(theme),
            if (ygButtonGroup != null) ygButtonGroup,
          ].withVerticalSpacing(theme.contentSpacing),
        ),
      ),
    );
  }

  Widget _buildHeader(YgDialogTheme theme) {
    return YgAnimatedContainer(
      decoration: style.iconBackground.map(
        (Color color) => BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      padding: style.iconPadding,
      child: YgAnimatedIconTheme(
        iconTheme: style.iconColor.map(
          (Color color) => IconThemeData(color: color),
        ),
        child: _buildHeaderContent(theme),
      ),
    );
  }

  Widget _buildTextSection(YgDialogTheme theme) {
    final String? description = widget.description;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: theme.titleTextStyle,
        ),
        if (description != null)
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.descriptionTextStyle,
          ),
      ].withVerticalSpacing(theme.titleDescriptionSpacing),
    );
  }

  Widget _buildHeaderContent(YgDialogTheme theme) {
    final LoadingDialogTheme loadingTheme = theme.loadingDialogTheme;
    final YgIcon? icon = widget.icon;

    if (icon == null) {
      return CircularProgressIndicator(
        strokeWidth: loadingTheme.circularProgressIndicatorWidth,
        color: loadingTheme.iconColor,
      );
    }

    return icon;
  }
}
