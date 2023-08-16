import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const YgTopAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
  });

  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    final YgTopAppBarTheme theme = context.topAppBarTheme;

    return AppBar(
      actions: actions,
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.backgroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: theme.smallTopAppBarTheme.titleTextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
