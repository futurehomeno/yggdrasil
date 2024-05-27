import 'package:args/command_runner.dart';

class AnalyzeCommand extends Command<int> {
  @override
  String get name => 'analyze';

  @override
  String get description => 'Analyze the design tokens json.';

  @override
  int run() {
    print('test');

    return 0;
  }
}
