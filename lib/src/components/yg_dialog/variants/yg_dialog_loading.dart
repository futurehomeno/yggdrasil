part of '../yg_dialog.dart';

class YgDialogLoading extends YgDialog {
  const YgDialogLoading({
    super.key,
    required super.title,
    super.description,
    super.ygButtonGroup,
  }) : super._();

  @override
  Widget _buildHeaderContent(YgDialogTheme dialogTheme) {
    return Padding(
      padding: dialogTheme.progressIndicatorPadding,
      child: const YgCircularProgressIndicator(),
    );
  }
}
