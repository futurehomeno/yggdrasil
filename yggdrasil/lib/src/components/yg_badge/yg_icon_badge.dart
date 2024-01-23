part of 'yg_badge.dart';

final class YgIconBadge extends YgBadge {
  const YgIconBadge({
    super.key,
    required this.icon,
    required super.child,
    super.alignment,
    super.weight,
  }) : super._();

  /// The icon shown in the badge.
  final YgColorableIconData icon;

  @override
  Widget buildBadgeContent(BuildContext context, YgBadgeStyle style) {
    return YgAnimatedIconTheme(
      iconTheme: style.iconTheme,
      child: YgIcon(icon),
    );
  }

  @override
  YgBadgeVariant get variant => YgBadgeVariant.icon;
}
