import 'package:flutter/widgets.dart';

class YgWizardStep {
  const YgWizardStep({
    required this.title,
    required this.content,
    this.nextButtonText,
    this.previousButtonText,
  });

  final String title;
  final Widget content;

  final String? previousButtonText;
  final String? nextButtonText;
}
