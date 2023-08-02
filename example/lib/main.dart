import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yggdrasil/yggdrasil.dart';
import 'package:yggdrasil_demo/translations/default_validator_errors.dart';

import 'core/_core.dart';
import 'screens/_screens.dart';

void main() {
  // Set up the locator service before initializing the app.
  setupLocator();

  runApp(
    ChangeNotifierProvider<YgAppState>(
      create: (BuildContext context) => YgAppState(),
      child: const Yggdrasil(),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
  });
}

class Yggdrasil extends StatelessWidget {
  const Yggdrasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<YgAppState>(
      builder: (BuildContext context, YgAppState ygAppState, Widget? child) {
        // Set the debug paint flags.

        debugOutlineEnabled = ygAppState.debugOutlineEnabled;

        return MaterialApp(
          key: ygAppState.key,
          title: 'Yggdrasil',
          theme: ygAppState.currentThemeData,
          builder: (BuildContext context, Widget? child) {
            return YgDefaultValidatorErrorsProvider(
              defaultErrors: buildDefaultValidatorErrors(),
              child: child!,
            );
          },
          home: const HomeScreen(),
          navigatorKey: YgRouter.navigatorKey,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
