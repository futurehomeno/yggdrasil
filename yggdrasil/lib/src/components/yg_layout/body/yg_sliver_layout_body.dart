import 'package:flutter/material.dart';

import '../widgets/yg_sliver_content_positioner.dart';

class YgSliverLayoutBody extends StatelessWidget {
  const YgSliverLayoutBody({
    super.key,
    required this.sliver,
  });

  final Widget sliver;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        YgSliverContentPositioner(
          child: SliverSafeArea(
            top: false,
            sliver: sliver,
          ),
        ),
      ],
    );
  }
}
