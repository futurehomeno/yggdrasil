import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/wizard_header/wizard_header_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgWizardController {
  YgWizardController({
    int initialStep = 0,
  }) : pageController = PageController(
          initialPage: initialStep,
        );

  final PageController pageController;

  void dispose() {
    pageController.dispose();
  }

  Future<void> nextStep() {
    final YgWizardHeaderTheme theme = _theme;

    return pageController.nextPage(
      duration: theme.animationDuration,
      curve: theme.animationCurve,
    );
  }

  Future<void> previousStep() {
    final YgWizardHeaderTheme theme = _theme;

    return pageController.previousPage(
      duration: theme.animationDuration,
      curve: theme.animationCurve,
    );
  }

  Future<void> animateToStep(int step) {
    final YgWizardHeaderTheme theme = _theme;

    return pageController.animateToPage(
      step,
      duration: theme.animationDuration,
      curve: theme.animationCurve,
    );
  }

  void jumpToStep(int step) {
    pageController.jumpToPage(
      step,
    );
  }

  int get step {
    if (pageController.positions.isEmpty) {
      return pageController.initialPage;
    }

    return pageController.page?.round() ?? 0;
  }

  YgWizardHeaderTheme get _theme => pageController.position.context.storageContext.wizardHeaderTheme;
}
