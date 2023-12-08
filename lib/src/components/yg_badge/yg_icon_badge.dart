part of 'yg_badge.dart';

final class YgIconBadge extends YgBadge {
  const YgIconBadge({
    super.key,
    required this.icon,
    required super.child,
    super.alignment,
    super.weight,
  }) : super._();

  /// The amount of items the badge should show.
  final YgIcon icon;

  @override
  Widget buildBadgeContent(BuildContext context, YgBadgeStyle style) {
    return YgAnimatedIconTheme(
      iconTheme: style.iconColor.map(
        (Color color) => IconTheme.of(context).copyWith(
          size: context.badgeTheme.iconSize,
          color: color,
        ),
      ),
      child: icon,
    );
  }

  @override
  YgBadgeVariant get variant => YgBadgeVariant.icon;
}
