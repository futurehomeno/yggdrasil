import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'core/_core.dart';
import 'screens/_screens.dart';

class Yggdrasil extends StatelessWidget {
  const Yggdrasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? child) {
        // Set the debug paint flags.
        if (ygAppState.debugOutlineEnabled != debugOutlineEnabled) {
          debugOutlineEnabled = ygAppState.debugOutlineEnabled;
          YgDebug.repaintAllInstances(context);
        }

        return MaterialApp(
          title: 'Yggdrasil',
          theme: ygAppState.currentThemeData,
          home: const HomeScreen(),
          navigatorKey: YgRouter.navigatorKey,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
