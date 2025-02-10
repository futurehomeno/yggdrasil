part of 'yg_layout_body.dart';

class _YgLayoutBodyRegular extends StatefulWidget implements YgLayoutBody {
  const _YgLayoutBodyRegular({
    super.key,
    required this.child,
    this.footer,
    this.loading = false,
    this.footerBehavior = YgFooterBehavior.sticky,
  });

  final Widget child;
  final Widget? footer;
  final YgFooterBehavior footerBehavior;
  @override
  final bool loading;

  @override
  State<_YgLayoutBodyRegular> createState() => _YgLayoutBodyRegularState();
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
    Widget? footer = widget.footer;
    if (footer == null) {
      return _buildLayout(
        child: SizedBox(
          key: _contentKey,
          child: widget.child,
        ),
        controller: controller,
        context: context,
      );
    }

    final YgLayoutTheme theme = context.layoutTheme;

    footer = Material(
      key: _footerKey,
      color: theme.backgroundColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: footer,
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
          child: Stack(
            children: <Widget>[
              Positioned.fill(
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: RepaintBoundary(
                  child: ValueListenableBuilder<YgLayoutBodyControllerValue>(
                    valueListenable: controller,
                    builder: (BuildContext context, YgLayoutBodyControllerValue value, Widget? child) {
                      return YgAnimatedOpacity(
                        opacity: value.extendAfter > 0.01 ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                // Color.fromRGBO(36, 45, 65, 0.19),
                                // Color.fromRGBO(36, 45, 65, 0),
                                Colors.black.withOpacity(0.19),
                                Colors.black.withOpacity(0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          height: 24,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
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
