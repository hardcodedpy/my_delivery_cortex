import 'dart:io';
import 'package:args/args.dart';

class CliService {
  final ArgParser parser = ArgParser()
    ..addCommand('start')
    ..addCommand('stop')
    ..addCommand('add')
    ..addCommand('status')
    ..addCommand('logs')
    ..addCommand('reset-db');

  Future<void> run(List<String> args) async {
    if (args.isEmpty) {
      _printUsage();
      exit(0);
    }

    final command = args.first;

    switch (command) {
      case 'add':
        await _addData();
        break;
      case 'start':
        await _startServer();
        break;
      case 'stop':
        _stopServer();
        break;
      case 'status':
        _statusServer();
        break;
      case 'logs':
        await _showLogs();
        break;
      case 'reset-db':
        await _resetDb();
        break;
      default:
        print('Unknown command: $command');
        _printUsage();
        break;
    }
  }

  Future<void> _addData() async {
    print('Adding new data to server...\n');

    stdout.write('Enter your name: ');
    final name = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Enter your email: ');
    final email = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Enter a message: ');
    final message = stdin.readLineSync()?.trim() ?? '';

    print('SUCESS');
  }

  void _printUsage() {
    print('Usage: dart cli.dart <command>');
    print(parser.usage);
  }

  Future<void> _startServer() async {
    print('Starting server...');
    // await server.startServer();
  }

  void _stopServer() {
    print('Stopping server...');
    print('Server must be terminated manually (Ctrl+C or kill)');
  }

  void _statusServer() {
    print('Check server status using: ps aux | grep dart');
  }

  Future<void> _showLogs() async {
    final logFile = File('logs/app.log');
    if (await logFile.exists()) {
      print(await logFile.readAsString());
    } else {
      print('No log file found.');
    }
  }

  Future<void> _resetDb() async {
    final hiveDir = Directory('hive_data');
    if (await hiveDir.exists()) {
      await hiveDir.delete(recursive: true);
      print('Hive database cleared.');
    } else {
      print('No Hive database found.');
    }
  }
}
