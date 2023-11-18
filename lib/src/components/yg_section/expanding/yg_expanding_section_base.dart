part of '../yg_section.dart';

abstract class _YgExpandingSectionBase extends YgSection {
  const _YgExpandingSectionBase({
    super.key,
    required String super.title,
    super.subtitle,
    super.tag,
    this.controller,
    this.initiallyExpanded = false,
  }) : super._();

  /// Controls the expansion of the section.
  final YgExpansionController? controller;

  /// Whether the section is expanded on initial load.
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final tag = this.tag;

    return YgExpander(
      headerBuilder: (context, controller) {
        return _YgSectionHeader(
          title: title ?? '',
          subtitle: subtitle,
          trailing: [
            if (tag != null) tag,
            _buildExpandButton(controller),
          ],
        );
      },
      controller: controller,
      initiallyExpanded: initiallyExpanded,
      child: buildChild(context),
    );
  }

  Widget _buildExpandButton(YgExpansionController controller) {
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return AnimatedRotation(
          turns: controller.expanded ? 0 : 0.5,
          duration: const Duration(milliseconds: 200),
          child: YgIconButton(
            onPressed: controller.toggle,
            child: const YgIcon(
              YgIcons.caretDown,
            ),
          ),
        );
      },
    );
  }
}
