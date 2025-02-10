part of 'yg_layout_body.dart';

class _YgLayoutBodySliver extends StatelessWidget implements YgLayoutBody {
  const _YgLayoutBodySliver({
    super.key,
    required this.sliver,
    this.loading = false,
  });

  final Widget sliver;
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
