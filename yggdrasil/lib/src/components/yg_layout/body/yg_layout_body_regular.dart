part of 'yg_layout_body.dart';

/// A scrollable layout with a optional footer.
class _YgLayoutBodyRegular extends StatefulWidget with StatefulWidgetDebugMixin implements YgLayoutBody {
  const _YgLayoutBodyRegular({
    super.key,
    required this.child,
    this.footer,
    this.loading = false,
    this.footerBehavior = YgFooterBehavior.sticky,
  });

  /// The child widget shown inside the scrollable view.
  final Widget child;

  /// The footer shown below the [child].
  ///
  /// Shown either at the bottom of the screen or the bottom of the content,
  /// depending on the [footerBehavior].
  final Widget? footer;

  /// The behavior of the footer.
  final YgFooterBehavior footerBehavior;

  /// Whether the parent [YgLayout] should show a loading indicator.
  @override
  final bool loading;

  @override
  State<_YgLayoutBodyRegular> createState() => _YgLayoutBodyRegularState();

  @override
  YgDebugType get debugType => YgDebugType.layout;
}

class _YgLayoutBodyRegularState extends State<_YgLayoutBodyRegular> {
  final GlobalKey<State<StatefulWidget>> _contentKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> _footerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return YgLayoutBodyInternal(
      builder: _buildContent,
      loading: widget.loading,
    );
  }

  Widget _buildContent(BuildContext context, YgLayoutBodyController controller) {
    final YgLayoutTheme theme = context.layoutTheme;
    final EdgeInsets themePadding = theme.footerPadding;

    final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(context);
    final EdgeInsets padding = MediaQuery.viewPaddingOf(context);

    Widget content = SizedBox(
      key: _contentKey,
      child: widget.child,
    );

    Widget? footer = widget.footer;
    EdgeInsets contentPadding = padding;
    Widget? bottom;

    if (footer != null) {
      footer = MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        removeTop: true,
        child: Padding(
          key: _footerKey,
          padding: themePadding,
          child: footer,
        ),
      );

      switch (widget.footerBehavior) {
        case YgFooterBehavior.pushDown:
          // The footer actually gets rendered in the content view.
          content = YgPushDownFooter(
            children: <Widget>[
              content,
              footer,
            ],
          );

          // Push up the content in the view when the on screen keyboard opens.
          bottom = SizedBox(
            height: viewInsets.bottom,
          );

          break;
        case YgFooterBehavior.sticky:
          // Since the footer is shown below the content, the footer has safe
          // area padding, and the content no longer needs it.
          contentPadding = contentPadding.copyWith(
            bottom: 0,
          );

          // Make the footer at least the height of the view insets to push the
          // bottom of the content on screen when the keyboard opens.
          bottom = ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: padding.bottom,
                left: padding.left,
                right: padding.right,
              ),
              child: footer,
            ),
          );

          break;
      }
    }

    return Column(
      children: <Widget>[
        Flexible(
          child: YgScrollShadow(
            top: false,
            child: RepaintBoundary(
              child: SingleChildScrollView(
                physics: YgLayoutHeaderAwareScrollPhysics(
                  controller: controller,
                ),
                child: RepaintBoundary(
                  child: YgLayoutContentPositioner(
                    contentPadding: contentPadding,
                    child: MediaQuery.removeViewInsets(
                      context: context,
                      removeBottom: true,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        removeLeft: true,
                        removeRight: true,
                        child: content,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (bottom != null) bottom,
      ],
    );
  }
}
