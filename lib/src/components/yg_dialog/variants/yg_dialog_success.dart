part of '../yg_dialog.dart';

class YgDialogSuccess extends YgDialog {
  const YgDialogSuccess({
    super.key,
    required super.title,
    super.description,
    super.ygButtonGroup,
  }) : super._();

  @override
  Widget _buildHeaderContent(YgDialogTheme dialogTheme) {
    return Padding(
      padding: dialogTheme.iconPadding,
      child: const YgIcon(
        YgIcons.lockGoodColorful,
      ),
    );
  }
}
