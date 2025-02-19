part of 'yg_layout_body.dart';

/// A scrollable sliver layout.
///
/// Enforces a minimum height on its child to allow centering of the content.
class _YgLayoutBodySliver extends StatelessWidget with StatelessWidgetDebugMixin implements YgLayoutBody {
  const _YgLayoutBodySliver({
    super.key,
    required this.sliver,
    this.loading = false,
  });

  /// The child sliver.
  final Widget sliver;

  /// Whether the parent [YgLayout] should show a loading indicator.
  @override
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets viewInsets = MediaQuery.viewInsetsOf(context);
    final EdgeInsets viewPadding = MediaQuery.viewPaddingOf(context);

    return YgLayoutBodyInternal(
      loading: loading,
      builder: (BuildContext context, YgLayoutBodyController controller) {
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
            child: CustomScrollView(
              physics: YgLayoutHeaderAwareScrollPhysics(
                controller: controller,
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
            ),
          ),
        );
      },
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
