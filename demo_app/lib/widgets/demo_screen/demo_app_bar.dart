import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/core/yg_app_state.dart';
import 'package:yggdrasil_demo/widgets/debug_bottom_sheet.dart';

class DemoAppBar extends StatelessWidget {
  const DemoAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? widget) {
        return YgAppBar(
          title: title,
          centerTitle: false,
          leading: const Padding(
            padding: EdgeInsets.all(12.5),
            child: YgIcon(
              YgIcons.yggColorful,
            ),
          ),
          actions: <YgIconButton>[
            YgIconButton(
              onPressed: () => YgDebug.toggleDebugging(context),
              onLongPress: () => Navigator.of(context).push(DebugBottomSheet()),
              icon: YgIcons.eyeOpen,
            ),
            YgIconButton(
              onPressed: ygAppState.toggleProfessionalTheme,
              icon: YgIcons.power,
            ),
            YgIconButton(
              onPressed: ygAppState.toggleDarkMode,
              icon: YgIcons.refresh,
            ),
          ],
        );
      },
    );
  }
}
