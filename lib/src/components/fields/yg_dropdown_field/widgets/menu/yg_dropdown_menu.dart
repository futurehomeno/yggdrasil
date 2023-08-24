part of 'yg_dropdown_menu_route.dart';

class _YgDropdownMenu<T extends Object> extends StatefulWidget {
  const _YgDropdownMenu({
    super.key,
    required this.entries,
    required this.onValueTapped,
    required this.isValueSelected,
    required this.onClose,
  });

  final List<YgDropdownEntry<T>> entries;
  final bool Function(T value) onValueTapped;
  final bool Function(T value) isValueSelected;
  final VoidCallback onClose;

  @override
  State<_YgDropdownMenu<T>> createState() => _YgDropdownMenuState<T>();
}

class _YgDropdownMenuState<T extends Object> extends State<_YgDropdownMenu<T>> {
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
          builder: (BuildContext context, ScrollController controller) {
            return CustomScrollView(
              controller: controller,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(5.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final YgDropdownEntry<T> entry = widget.entries[index];

                        return YgDropdownMenuItem(
                          icon: entry.icon,
                          selected: widget.isValueSelected(entry.value),
                          subtitle: entry.subtitle,
                          title: entry.title,
                          onPressed: () => _onValueTapped(entry.value),
                        );
                      },
                      childCount: widget.entries.length,
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

  void _onValueTapped(T value) {
    if (widget.onValueTapped(value)) {
      widget.onClose();
      Navigator.of(context).pop();
    }

    setState(() {});
  }
}
