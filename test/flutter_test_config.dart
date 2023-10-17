import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:yggdrasil/yggdrasil.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // SETUP FOR GOLDEN TOOLKIT
  // await loadAppFonts();

  // return testMain();

  // SETUP FOR ALCHEMIST
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
      ),
      theme: YgThemeDataHelper.getThemeData(YgTheme.consumerLight),
    ),
    run: testMain,
  );
}
