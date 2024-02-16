part of '../yg_dialog.dart';

class YgDialogBase extends YgDialog {
  const YgDialogBase({
    super.key,
    required this.icon,
    required super.title,
    super.description,
    super.ygButtonGroup,
  }) : super._();

  /// Content that is displayed above the title, typically an icon.
  ///
  /// The content is wrapped in a circular container with a background color.
  final YgIcon icon;

  @override
  Widget _buildHeaderContent(YgDialogTheme dialogTheme) {
    return Padding(
      padding: dialogTheme.iconPadding,
      child: icon,
    );
  }
}
