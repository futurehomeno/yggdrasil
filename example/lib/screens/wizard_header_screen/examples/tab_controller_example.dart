import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';

class TabControllerExample extends StatefulWidget {
  const TabControllerExample({super.key});

  @override
  State<TabControllerExample> createState() => _TabControllerExampleState();
}

class _TabControllerExampleState extends State<TabControllerExample> with TickerProviderStateMixin {
  late final TabController controller = TabController(
    vsync: this,
    length: 5,
    animationDuration: const Duration(milliseconds: 500),
    initialIndex: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        YgWizardHeader.fromTabController(
          controller: controller,
          title: 'A TabController controlled YgWizardHeader',
          buildCounter: (int p0, int p1) => 'Step $p0 of $p1',
        ),
        SizedBox(
          height: 100,
          child: TabBarView(
            controller: controller,
            children: List<Widget>.generate(
              controller.length,
              (int index) => StepNavigator(
                onPrevious: () => controller.animateTo(index - 1),
                onNext: () => controller.animateTo(index + 1),
                step: index,
                steps: controller.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
