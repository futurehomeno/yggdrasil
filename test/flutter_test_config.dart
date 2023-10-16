import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  // TestWidgetsFlutterBinding.ensureInitialized();

  // final FontLoader fontLoader = FontLoader('Open Sans')
  //   ..addFont(rootBundle.load('assets/fonts/open_sans/OpenSans-Regular.ttf'));
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-ExtraBold.ttf'))
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-ExtraLight.ttf'))
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-Light.ttf'))
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-Medium.ttf'))
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-Regular.ttf'))
  // ..addFont(rootBundle.load('assets/fonts/dosis/Dosis-SemiBold.ttf'));

  // await fontLoader.load();

  return testMain();
}
