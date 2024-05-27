import 'package:args/command_runner.dart';
import 'package:yggdrasil_theme_generator/theme_generator.dart';

class GenerateCommand extends Command<int> {
  GenerateCommand() {
    argParser.addFlag(
      'ignore-errors',
      abbr: 'i',
      negatable: false,
      help: 'Ignore errors and generate tokens anyways.',
    );
  }
  @override
  String get name => 'generate';

  @override
  String get description => 'Generate theme from design tokens json.';

  @override
  int run() {
    final bool ignoreErrors = argResults?['ignore-errors'] as bool;
    print('Ignore errors: $ignoreErrors');

    ThemeGenerator().generateTheme(tokenDirectory: 'tokenDirectory', themeDirectory: 'themeDirectory');

    return 0;
  }
}
