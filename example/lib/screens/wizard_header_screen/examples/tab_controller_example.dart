import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '../widgets/_widgets.dart';

class TabControllerExample extends StatefulWidget {
  const TabControllerExample({super.key});

  @override
  State<TabControllerExample> createState() => _TabControllerExampleState();
}

class _TabControllerExampleState extends State<TabControllerExample> with TickerProviderStateMixin {
  late final TabController _controller = TabController(
    vsync: this,
    length: 5,
    animationDuration: const Duration(milliseconds: 300),
    initialIndex: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        YgWizardHeader.fromTabController(
          controller: _controller,
          titleBuilder: (_) => 'A TabController controlled YgWizardHeader',
          counterBuilder: (int p0, int p1) => 'Step $p0 of $p1',
        ),
        SizedBox(
          height: 60,
          child: TabBarView(
            controller: _controller,
            children: List<Widget>.generate(
              _controller.length,
              (int index) => StepNavigator(
                onPrevious: () => _controller.animateTo(index - 1),
                onNext: () => _controller.animateTo(index + 1),
                step: index,
                steps: _controller.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
