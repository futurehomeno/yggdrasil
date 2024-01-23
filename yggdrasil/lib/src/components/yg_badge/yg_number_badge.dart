part of 'yg_badge.dart';

final class YgNumberBadge extends YgBadge {
  const YgNumberBadge({
    super.key,
    required this.amount,
    required super.child,
    super.alignment,
    super.weight,
  }) : super._();

  /// The amount of items the badge should show.
  final int amount;

  static const int _maxBadgeCount = 9;

  @override
  Widget buildBadgeContent(BuildContext context, YgBadgeStyle style) {
    final YgBadgeTheme theme = context.badgeTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: theme.textMinWidth,
      ),
      child: DefaultTextStyleTransition(
        style: style.textStyle,
        child: Text(
          amount > _maxBadgeCount ? '$_maxBadgeCount+' : amount.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  YgBadgeVariant get variant => YgBadgeVariant.number;
}
