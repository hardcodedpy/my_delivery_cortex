import 'dart:convert';
import 'dart:io';

import 'bin/data/service/cli_service.dart';
import 'bin/server.dart';
import 'bin/services/auth_service.dart';

void main(List<String> args) async {
  await Server.start();
  print('Server running on http://localhost:8080');

  // ================= Loop CLI =================
  print('Enter command (add, list, logs, exit):');

  final cli = CliService(authService: AuthService());

  await for (var line
      in stdin.transform(utf8.decoder).transform(const LineSplitter())) {
    final cmd = line.trim().toLowerCase();
    await cli.run([cmd]);
  }
}
