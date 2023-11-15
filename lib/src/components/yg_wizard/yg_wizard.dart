import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_wizard_controller.dart';

class YgWizard extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgWizard({
    super.key,
    required this.steps,
    required this.counterBuilder,
    required this.controller,
  });

  final List<YgWizardStep> steps;
  final CounterBuilderCallback counterBuilder;
  final YgWizardController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgWizardHeader.fromPageController(
          controller: controller.pageController,
          counterBuilder: counterBuilder,
          titleBuilder: (int step) => steps[step].title,
          steps: steps.length,
        ),
        Expanded(
          child: PageView.builder(
            itemCount: steps.length,
            controller: controller.pageController,
            itemBuilder: _buildChild,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }

  Widget _buildChild(BuildContext context, int index) {
    final YgWizardStep step = steps[index];

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return YgScrollShadow.builder(
                builder: (BuildContext context, ScrollController controller) {
                  return SingleChildScrollView(
                    controller: controller,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        maxWidth: constraints.maxWidth,
                        minWidth: constraints.minWidth,
                        minHeight: constraints.maxHeight,
                      ),
                      child: step.contentBuilder(context),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: step.buttons,
        ),
      ],
    );
  }

  @override
  YgDebugType get debugType => YgDebugType.layout;
}
