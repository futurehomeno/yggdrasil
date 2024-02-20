part of 'yg_dropdown_menu_route.dart';

class _YgDropdownMenu<T extends Object> extends StatelessWidget with StatelessWidgetDebugMixin {
  const _YgDropdownMenu({
    super.key,
    required this.metric,
    required this.entries,
    required this.controller,
  });

  final YgAnyDropdownController<T> controller;
  final List<YgDropdownEntry<T>> entries;
  final String? metric;

  @override
  Widget build(BuildContext context) {
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return Material(
      elevation: theme.menuElevation,
      color: theme.menuItemBackground,
      borderRadius: theme.menuRadius,
      clipBehavior: Clip.antiAlias,
      child: YgScrollShadow.builder(
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: theme.menuPadding,
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
    );
  }

  List<Widget> _buildEntries() {
    final List<Widget> widgets = <Widget>[];

    for (final YgDropdownEntry<T> entry in entries) {
      widgets.add(
        YgDropdownMenuItem(
          icon: entry.icon,
          selected: controller.isValuePendingSelected(entry.value),
          subtitle: entry.subtitle,
          title: entry.titleWithMetric(metric),
          onPressed: () => controller.onValueTapped(
            entry.value,
            autoSubmit: true,
          ),
        ),
      );
    }

    return widgets;
  }
}
