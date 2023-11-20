import 'package:args/command_runner.dart';
import 'package:ipp_starter_kit/commands/build_runner.dart';
import 'package:ipp_starter_kit/commands/change_app_name.dart';
import 'package:ipp_starter_kit/commands/create.dart';

Future<void> main(List<String> args) async {
  final runner = CommandRunner('ipp', 'Official CLI for IPP xD')
    ..addCommand(CreateCommand())
    ..addCommand(ChangeAppNameCommand())
    ..addCommand(BuildRunnerCommand());

  await runner.run(args);
}
