import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_layout/body/yg_layout_body_internal.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_aware_scroll_physics.dart';
import 'package:yggdrasil/src/components/yg_layout/controller/yg_layout_header_controller.dart';
import 'package:yggdrasil/src/components/yg_layout/widgets/yg_sliver_content_positioner.dart';

class YgSliverLayoutBody extends StatelessWidget {
  const YgSliverLayoutBody({
    super.key,
    required this.sliver,
    this.loading = false,
  });

  final Widget sliver;
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
