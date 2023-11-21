import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class CreateNativeSplashCommand extends Command {
  @override
  String get description => "change app package name ";

  @override
  String get name => 'change_package_Name';
  static const _packageName = 'package_name';

  CreateCommand() {
    argParser.addOption(
      _packageName,
      abbr: 'p',
      help: 'your package name',
      defaultsTo: "com.example.app",
    );
  }

  @override
  FutureOr? run() async {
    final cwd = Directory.current.path;
    await Process.run(
      'flutter',
      [
        'pub',
        'run',
        'change_app_package_name:main',
        _packageName,
      ],
      workingDirectory: cwd,
    );
    print('all done');
  }
}
