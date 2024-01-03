import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/_core.dart';
import 'yggdrasil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up the locator service before initializing the app.
  sl.registerSingleton(const YgRouter());

  runApp(
    ChangeNotifierProvider<YgAppState>(
      create: (BuildContext context) => YgAppState()..init(),
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
