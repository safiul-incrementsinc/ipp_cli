import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class ChangeAppIconsCommand extends Command {
  @override
  String get description => "change app icon ";

  @override
  String get name => 'change_app_icon';

  @override
  FutureOr? run() async {
    final cwd = Directory.current.path;
    await Process.run(
      'flutter',
      [
        'pub',
        'run',
        'flutter_launcher_icons',
      ],
      workingDirectory: cwd,
    );
    print('all done');
  }
}
