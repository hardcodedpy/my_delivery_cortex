import 'dart:convert';
import 'dart:io';

import 'bin/data/service/cli_service.dart';
import 'bin/data/service/hive_service.dart';
import 'bin/services/auth_service.dart';

void main(List<String> args) async {
  HiveService.init();

  print('command:');
  final cli = CliService(authService: AuthService());

  await for (var line
      in stdin.transform(utf8.decoder).transform(const LineSplitter())) {
    final cmd = line.trim().toLowerCase();
    await cli.run([cmd]);
    print('command');
  }
}
