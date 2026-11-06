import 'dart:async';

/// Plain widget tests, no alchemist setup needed.
///
/// This config intentionally shadows the root [flutter_test_config.dart] so
/// the tests in this directory run without the golden test wrapper.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await testMain();
}
