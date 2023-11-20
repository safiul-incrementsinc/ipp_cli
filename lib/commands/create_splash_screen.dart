import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

class CreateNativeSplashCommand extends Command {
  @override
  String get description => "create native splash screen";

  @override
  String get name => 'flutter_native_splash';

  @override
  FutureOr? run() async {
    final cwd = Directory.current.path;
    Process.runSync(
      'flutter',
      [
        'pub',
        'run',
        'flutter_native_splash:create',
        '--path=flutter_native_splash.yaml'
      ],
      workingDirectory: cwd,
    );
    print('created main splash screen');

    Process.runSync(
      'flutter',
      ['pub', 'run', 'flutter_native_splash:create', '--flavor', 'production'],
      workingDirectory: cwd,
    );
    print('created production splash screen');

    Process.runSync(
      'flutter',
      ['pub', 'run', 'flutter_native_splash:create', '--flavor', 'development'],
      workingDirectory: cwd,
    );
    print('created development splash screen');

    Process.runSync(
      'flutter',
      ['pub', 'run', 'flutter_native_splash:create', '--flavor', 'staging'],
      workingDirectory: cwd,
    );
    print('created staging splash screen');
    print('all done');
  }
}
