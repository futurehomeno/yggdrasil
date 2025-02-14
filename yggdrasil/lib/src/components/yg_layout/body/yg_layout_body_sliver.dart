part of 'yg_layout_body.dart';

/// A scrollable sliver layout.
///
/// Enforces a minimum height on its child to allow centering of the content.
class _YgLayoutBodySliver extends StatelessWidget implements YgLayoutBody {
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
    return YgLayoutBodyInternal(
      loading: loading,
      builder: (BuildContext context, YgLayoutBodyController controller) {
        return CustomScrollView(
          physics: YgLayoutHeaderAwareScrollPhysics(
            controller: controller,
          ),
          slivers: <Widget>[
            YgSliverContentPositioner(
              child: SliverSafeArea(
                top: false,
                sliver: sliver,
              ),
            ),
          ],
        );
      },
    );
  }
}
