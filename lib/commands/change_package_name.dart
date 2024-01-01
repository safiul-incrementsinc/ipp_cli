import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class ChangePackageNameCommand extends Command {
  @override
  String get description => "change app package name ";

  @override
  String get name => 'change_package_Name';
  static const _packageName = 'package_name';

  ChangePackageNameCommand() {
    argParser.addOption(
      _packageName,
      abbr: 'p',
      help: 'your package name',
      defaultsTo: "com.example.app",
    );
  }

  @override
  FutureOr? run() async {
    if (argResults!.rest.isEmpty) {
      print('Please specify a package name');
      return null;
    }
    final packageName = argResults!.rest.first;
    print(packageName);
    final cwd = Directory.current.path;
    await Process.run(
      'flutter',
      [
        'pub',
        'run',
        'change_app_package_name:main',
        packageName,
      ],
      workingDirectory: cwd,
    );
    print('all done');
  }
}
