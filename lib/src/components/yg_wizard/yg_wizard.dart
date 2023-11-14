import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_wizard/models/yg_wizard_step.dart';

class YgWizard extends StatefulWidget {
  const YgWizard({
    super.key,
    required this.steps,
    required this.counterBuilder,
  });

  final List<YgWizardStep> steps;
  final CounterBuilderCallback counterBuilder;

  @override
  State<YgWizard> createState() => _YgWizardState();
}

class _YgWizardState extends State<YgWizard> with TickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: widget.steps.length,
    vsync: this,
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
          counterBuilder: widget.counterBuilder,
          titleBuilder: (int step) => widget.steps[step].title,
        ),
      ],
    );
  }
}
