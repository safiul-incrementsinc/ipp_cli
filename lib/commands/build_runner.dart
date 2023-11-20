import 'dart:io';

import 'package:args/command_runner.dart';

class BuildRunnerCommand extends Command {
  @override
  String get description =>
      "this command will run build runner for code generate";

  @override
  String get name => 'build_runner';

  BuildRunnerCommand() {
    argParser.addFlag(
      "watch",
      abbr: 'w',
      negatable: false,
      help: 'Enable build runner watch mode',
    );
  }

  @override
  Future<void> run() async {
    final cwd = Directory.current.path;
    Process.runSync(
      'flutter',
      [
        'clean',
      ],
      workingDirectory: cwd,
    );

    Process.runSync(
      'flutter',
      [
        'pub',
        'get',
      ],
      workingDirectory: cwd,
    );
    if (argResults!['watch'] == true) {
      Process.runSync(
        'flutter',
        [
          'pub',
          'run',
          'build_runner',
          'watch',
          '--delete-conflicting-outputs',
        ],
        workingDirectory: cwd,
      );
    } else {
      Process.runSync(
        'flutter',
        [
          'pub',
          'run',
          'build_runner',
          'build',
          '--delete-conflicting-outputs',
        ],
        workingDirectory: cwd,
      );
    }
  }
}
