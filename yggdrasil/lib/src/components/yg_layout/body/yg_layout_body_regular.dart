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
    final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(context);

    Widget? footer = widget.footer;
    if (footer == null) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: viewInsets.bottom,
        ),
        child: _buildLayout(
          child: SizedBox(
            key: _contentKey,
            child: widget.child,
          ),
          controller: controller,
          context: context,
        ),
      );
    }

    final YgLayoutTheme theme = context.layoutTheme;
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
    final EdgeInsets themePadding = theme.footerPadding;

    final EdgeInsets footerPadding = EdgeInsets.only(
      bottom: viewPadding.bottom + themePadding.bottom,
      left: viewPadding.left + themePadding.left,
      right: viewPadding.right + themePadding.right,
      top: themePadding.top,
    );

    footer = Material(
      key: _footerKey,
      color: theme.backgroundColor,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        removeLeft: true,
        removeRight: true,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewInsets.bottom,
          ),
          child: Padding(
            padding: footerPadding,
            child: footer,
          ),
        ),
      ),
    );

    switch (widget.footerBehavior) {
      case YgFooterBehavior.sticky:
        return _buildStickyLayout(
          context,
          controller,
          footer,
        );
      case YgFooterBehavior.pushDown:
        return _buildPushDownLayout(
          context,
          controller,
          footer,
        );
    }
  }

  Widget _buildPushDownLayout(
    BuildContext context,
    YgLayoutBodyController controller,
    Widget footer,
  ) {
    return _buildLayout(
      child: YgPushDownFooter(
        children: <Widget>[
          SizedBox(
            key: _contentKey,
            child: widget.child,
          ),
          footer,
        ],
      ),
      controller: controller,
      context: context,
    );
  }

  Column _buildStickyLayout(
    BuildContext context,
    YgLayoutBodyController controller,
    Widget footer,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ValueListenableBuilder<YgLayoutBodyControllerValue>(
            valueListenable: controller,
            builder: (BuildContext context, YgLayoutBodyControllerValue value, Widget? child) {
              return YgScrollShadowOverlay(
                bottom: value.extendAfter > 0,
                child: child!,
              );
            },
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: _buildLayout(
                child: SizedBox(
                  key: _contentKey,
                  child: widget.child,
                ),
                controller: controller,
                context: context,
              ),
            ),
          ),
        ),
        footer,
      ],
    );
  }

  Widget _buildLayout({
    required BuildContext context,
    required Widget child,
    required YgLayoutBodyController controller,
  }) {
    return RepaintBoundary(
      child: SingleChildScrollView(
        physics: YgLayoutHeaderAwareScrollPhysics(
          controller: controller,
        ),
        child: RepaintBoundary(
          child: YgLayoutContentPositioner(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              removeLeft: true,
              removeRight: true,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
