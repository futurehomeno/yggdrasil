import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

part 'variants/yg_dialog_base.dart';
part 'variants/yg_dialog_error.dart';
part 'variants/yg_dialog_info.dart';
part 'variants/yg_dialog_loading.dart';
part 'variants/yg_dialog_success.dart';

abstract class YgDialog extends StatelessWidget with StatelessWidgetDebugMixin {
  const factory YgDialog({
    String? description,
    required YgIcon icon,
    Key? key,
    required String title,
    YgButtonGroup? ygButtonGroup,
  }) = YgDialogBase;

  const factory YgDialog.info({
    String? description,
    Key? key,
    required String title,
    YgButtonGroup? ygButtonGroup,
  }) = YgDialogInfo;

  const factory YgDialog.error({
    String? description,
    Key? key,
    required String title,
    YgButtonGroup? ygButtonGroup,
  }) = YgDialogError;

  const factory YgDialog.success({
    String? description,
    Key? key,
    required String title,
    YgButtonGroup? ygButtonGroup,
  }) = YgDialogSuccess;

  const factory YgDialog.loading({
    String? description,
    Key? key,
    required String title,
    YgButtonGroup? ygButtonGroup,
  }) = YgDialogLoading;

  const YgDialog._({
    super.key,
    required this.title,
    this.description,
    this.ygButtonGroup,
  });

  /// Title of the dialog.
  final String title;

  /// Description of the dialog.
  final String? description;

  /// Optional buttons that are displayed at the bottom of the dialog.
  ///
  /// For non-dismissible dialogs, with the exception of loading dialogs,
  /// the buttons are required and must allow the user to close the dialog.
  final YgButtonGroup? ygButtonGroup;

  @override
  Widget build(BuildContext context) {
    final YgDialogTheme dialogTheme = context.dialogTheme;
    final YgButtonGroup? ygButtonGroup = this.ygButtonGroup;

    return Material(
      borderRadius: dialogTheme.outerBorderRadius,
      color: dialogTheme.backgroundColor,
      child: Padding(
        padding: dialogTheme.outerPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildHeader(dialogTheme),
            _buildTextSection(dialogTheme),
            if (ygButtonGroup != null) ygButtonGroup,
          ].withVerticalSpacing(30.0),
        ),
      ),
    );
  }

  Widget _buildHeader(YgDialogTheme dialogTheme) {
    return Container(
      decoration: BoxDecoration(
        color: dialogTheme.iconContainerColor,
        shape: BoxShape.circle,
      ),
      child: _buildHeaderContent(dialogTheme),
    );
  }

  Widget _buildTextSection(YgDialogTheme dialogTheme) {
    final String? description = this.description;

    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: dialogTheme.titleTextStyle,
        ),
        if (description != null)
          Text(
            description,
            textAlign: TextAlign.center,
            style: dialogTheme.descriptionTextStyle,
          ),
      ].withVerticalSpacing(dialogTheme.titleDescriptionSpacing),
    );
  }

  Widget _buildHeaderContent(YgDialogTheme dialogTheme);
}
