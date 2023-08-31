part of 'yg_dropdown_menu_route.dart';

class _YgDropdownMenu<T extends Object> extends StatelessWidget with StatelessWidgetDebugMixin {
  const _YgDropdownMenu({
    super.key,
    required this.entries,
    required this.controller,
    required this.onClose,
  });

  final YgDynamicDropdownController<T> controller;
  final List<YgDropdownEntry<T>> entries;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return Material(
      elevation: 5,
      color: theme.menuItemBackground,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: YgScrollShadow.builder(
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListenableBuilder(
                  listenable: controller,
                  builder: (BuildContext context, Widget? child) {
                    return Column(
                      children: _buildEntries(),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];

    for (final YgDropdownEntry<T> entry in entries) {
      widgets.add(
        YgDropdownMenuItem(
          icon: entry.icon,
          selected: controller.isEntrySelected(entry),
          subtitle: entry.subtitle,
          title: entry.title,
          onPressed: () => _onEntryTapped(entry),
        ),
      );
    }

    return widgets;
  }

  void _onEntryTapped(YgDropdownEntry<T> value) {
    controller.onEntryTapped(value);
  }
}
