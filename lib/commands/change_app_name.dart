import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:args/command_runner.dart';
import 'package:ipp_starter_kit/utils.dart';

class ChangeAppNameCommand extends Command {
  @override
  String get description => "change app display name";

  @override
  String get name => 'change_app_name';

  static const _appName = 'app-name';

  ChangeAppNameCommand() {
    argParser.addOption(
      _appName,
      abbr: 'n',
      help: 'App Display Name',
    );
  }

  @override
  FutureOr? run() async {
    final cwd = Directory.current.path;
    if (argResults!.rest.isEmpty) {
      print('Please specify a name');
      return null;
    }
    String name = '';
    for (final element in argResults!.rest) {
      name = '$name$element ';
    }
    name = replaceCharAt(name, name.length - 1, '');

    /// app/gradle
    final gradle = File('$cwd/android/app/build.gradle');
    final gradleLines = gradle.readAsLinesSync();
    final newLinesGradle = <String>[];
    for (final line in gradleLines) {
      if (line.contains('appName:')) {
        final rx = RegExp(r'[^"]*(?:"(.*?)")?.*');
        final match = rx.firstMatch(line);
        if (match![1]!.contains('[STG]')) {
          newLinesGradle.add(
            line.replaceFirst(
              match[1] ?? '',
              "[STG] $name",
            ),
          );
        } else if (match[1]!.contains('[DEV]')) {
          newLinesGradle.add(
            line.replaceFirst(
              match[1] ?? '',
              "[DEV] $name",
            ),
          );
        } else {
          newLinesGradle.add(
            line.replaceFirst(
              match[1] ?? '',
              name,
            ),
          );
        }
      } else {
        newLinesGradle.add(line);
      }
    }
    gradle.writeAsStringSync(newLinesGradle.join('\n'));
  }
}
