import 'package:flutter/widgets.dart';
import 'package:yggdrasil/src/components/yg_button_group/_yg_button_group.dart';

class YgWizardStep {
  const YgWizardStep({
    required this.title,
    required this.contentBuilder,
    required this.buttons,
  });

  final WidgetBuilder contentBuilder;
  final String title;
  final YgButtonGroup buttons;
}
