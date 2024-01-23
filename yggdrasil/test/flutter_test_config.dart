import 'dart:async';

import 'package:alchemist/alchemist.dart';

/// Here we can specify global test configurations.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(),
    run: testMain,
  );
}
