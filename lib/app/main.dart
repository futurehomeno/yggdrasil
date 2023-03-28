import 'package:flutter/material.dart';
import 'package:yggdrasil/app/core/_core.dart';
import 'package:yggdrasil/src/theme/theme.dart';

import 'screens/home_screen.dart';

void main() {
  // Set up the locator service before initializing the app.
  setupLocator();

  runApp(const Yggdrasil());
}

class Yggdrasil extends StatelessWidget {
  const Yggdrasil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yggdrasil',
      theme: ThemeData(
        brightness: Brightness.light,
        extensions: <YgTheme>[YgTheme.consumerLight],
      ),
      home: const HomeScreen(),
      navigatorKey: YgRouter.navigatorKey,
    );
  }
}
