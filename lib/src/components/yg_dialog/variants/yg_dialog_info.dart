part of '../yg_dialog.dart';

class YgDialogInfo extends YgDialog {
  const YgDialogInfo({
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
        YgIcons.supportBubble,
      ),
    );
  }
}
