part of 'yg_layout_body.dart';

/// A scrollable sliver layout.
///
/// Enforces a minimum height on its child to allow centering of the content.
class _YgLayoutBodySliver extends StatelessWidget with StatelessWidgetDebugMixin implements YgLayoutBody {
  const _YgLayoutBodySliver({
    super.key,
    required this.sliver,
    this.loading = false,
    this.onRefresh,
  });

  /// The child sliver.
  final Widget sliver;

  /// Whether the parent [YgLayout] should show a loading indicator.
  @override
  final bool loading;

  /// Called when the user performs a pull-to-refresh gesture.
  ///
  /// When non-null, a [RefreshIndicator] is wrapped around the scrollable. The
  /// returned future should complete when the refresh has finished.
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(context);
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);
    final Future<void> Function()? onRefresh = this.onRefresh;

    return YgLayoutBodyInternal(
      loading: loading,
      builder: (BuildContext context, YgLayoutBodyController controller) {
        Widget scrollable = CustomScrollView(
          physics: YgLayoutHeaderAwareScrollPhysics(
            controller: controller,
            parent: _refreshPhysicsParent(context, onRefresh),
          ),
          slivers: <Widget>[
            YgSliverContentPositioner(
              child: SliverPadding(
                padding: viewPadding.copyWith(
                  top: 0,
                ),
                sliver: sliver,
              ),
            ),
          ],
        );

        if (onRefresh != null) {
          scrollable = YgLayoutBodyRefreshIndicator(
            onRefresh: onRefresh,
            child: scrollable,
          );
        }

        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          removeLeft: true,
          removeRight: true,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: viewInsets.bottom,
            ),
            child: scrollable,
          ),
        );
      },
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
