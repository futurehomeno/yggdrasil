part of 'yg_dropdown_menu_route.dart';

class YgDropdownMenuItem extends StatelessWidget {
  const YgDropdownMenuItem({
    super.key,
    required this.title,
    required this.selected,
    required this.icon,
    required this.subtitle,
    required this.onPressed,
  });

  final bool selected;
  final Widget? icon;
  final String title;
  final String? subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final String? subtitle = this.subtitle;
    final Widget? icon = this.icon;
    final YgDropdownFieldTheme theme = context.fieldTheme.dropdownTheme;

    return Material(
      color: theme.menuItemBackground,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        onTap: onPressed,
        child: Padding(
          padding: theme.menuItemPadding,
          child: Row(
            children: <Widget>[
              if (icon != null)
                Padding(
                  padding: theme.menuItemPrefixPadding,
                  child: icon,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: theme.menuItemTitleStyle,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: theme.menuItemSubtitleStyle,
                      ),
                  ],
                ),
              ),
              if (selected)
                Padding(
                  padding: theme.menuItemSuffixPadding,
                  child: const YgIcon(
                    YgIcons.check,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
