part of 'yg_avatar.dart';

class _YgPersonAvatar extends YgAvatar {
  const _YgPersonAvatar({
    super.key,
    required super.name,
    super.autofocus,
    super.focusNode,
    super.image,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    super.size,
    this.badge,
  })  : assert(
          badge == null || size != YgAvatarSize.small,
          'Can not have role on a small avatar',
        ),
        super.company();

  final YgIcon? badge;

  @override
  Widget build(BuildContext context) {
    final Widget? badge = _buildBadge(context);

    return Stack(
      children: <Widget>[
        super.build(context),
        if (badge != null) badge,
      ],
    );
  }

  Widget? _buildBadge(BuildContext context) {
    final YgPersonAvatarTheme theme = context.avatarTheme.personAvatarTheme;
    final YgIcon? badge = this.badge;

    if (badge == null || size == YgAvatarSize.small) {
      return null;
    }

    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: theme.badgePadding,
        decoration: BoxDecoration(
          border: theme.badgeBorder,
          borderRadius: theme.borderRadius,
          color: theme.badgeColor,
        ),
        child: IconTheme(
          data: IconTheme.of(context).copyWith(
            size: 15.0,
          ),
          child: badge,
        ),
      ),
    );
  }

  @override
  YgAvatarButtonVariant get _variant => YgAvatarButtonVariant.person;
}
