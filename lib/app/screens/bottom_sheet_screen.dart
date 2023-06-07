import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/app/modals/example_bottom_sheet_without_footer.dart';
import 'package:yggdrasil/src/components/_components.dart';

import '../modals/example_bottom_sheet.dart';
import '../modals/example_scrollable_bottom_sheet.dart';
import '../widgets/yg_screen.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  static const String routeName = 'BottomSheetScreen';

  static PageRouteBuilder<Widget> route() {
    return YgRouteBuilder().fadeTransition(
      settings: const RouteSettings(name: routeName),
      screen: const BottomSheetScreen(),
    );
  }

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return YgScreen(
      componentName: 'Bottom sheet',
      componentDesc: 'Bottom sheet',
      supernovaLink: 'Link',
      scrollable: false,
      child: Column(
        children: <Widget>[
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(ExampleBottomSheet());
            },
            child: const Text('Show default bottom sheet'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(ExampleScrollableBottomSheet());
            },
            child: const Text('Show scrollable bottom sheet'),
          ),
          YgButton(
            variant: ButtonVariant.primary,
            onPressed: () {
              Navigator.of(context).push(ExampleBottomSheetWithoutFooter());
            },
            child: const Text('Show bottom sheet without footer'),
          ),
        ],
      ),
    );
  }
}
