import 'package:args/command_runner.dart';

import 'commands/_commands.dart';

class DTUtilCommandRunner extends CommandRunner<int> {
  DTUtilCommandRunner()
      : super(
          'dtutil',
          'A tool for analyzing design tokens and generating flutter theme code',
        ) {
    addCommand(AnalyzeCommand());
    addCommand(GenerateCommand());
  }
}
