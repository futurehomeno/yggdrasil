part of '../yg_dialog.dart';

class YgDialogError extends YgDialog {
  const YgDialogError({
    super.key,
    required super.title,
    super.description,
    super.ygButtonGroup,
  }) : super._();

  @override
  Widget _buildHeaderContent(YgDialogTheme dialogTheme) {
    return Padding(
      padding: dialogTheme.iconPadding,
      child: YgIcon(
        YgIcons.failed,
        color: dialogTheme.iconErrorColor,
      ),
    );
  }
}
