import 'dart:convert';
import 'dart:io';

import 'bin/data/service/cli_service.dart';

void main(List<String> args) async {
  print('Server running on http://localhost:8080');

  // ================= Loop CLI =================
  print('Enter command (add, list, logs, exit):');

  final cli = CliService();

  await for (var line
      in stdin.transform(utf8.decoder).transform(const LineSplitter())) {
    stdout.write('\x1B[2J\x1B[0;0H');
    final cmd = line.trim().toLowerCase();
    await cli.run([cmd]);
  }
}
