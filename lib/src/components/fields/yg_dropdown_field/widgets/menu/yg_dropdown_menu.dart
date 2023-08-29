part of 'yg_dropdown_menu_route.dart';

class _YgDropdownMenu<T extends Object> extends StatelessWidget {
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
            return CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(5.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final YgDropdownEntry<T> entry = entries[index];

                        return ListenableBuilder(
                          listenable: controller,
                          builder: (context, child) {
                            return YgDropdownMenuItem(
                              icon: entry.icon,
                              selected: controller.isEntrySelected(entry),
                              subtitle: entry.subtitle,
                              title: entry.title,
                              onPressed: () => _onEntryTapped(entry),
                            );
                          },
                        );
                      },
                      childCount: entries.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onEntryTapped(YgDropdownEntry<T> value) {
    controller.onEntryTapped(value);
  }
}
