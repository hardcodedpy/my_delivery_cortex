import 'dart:io';
import 'package:args/args.dart';

import '../../services/auth_service.dart';
import '../models/usr.dart';
import '../../core/utils.dart';

class CliService {
  AuthService authService;

  CliService({required this.authService});
  final ArgParser parser = ArgParser()
    ..addCommand('add-usr')
    ..addCommand('login')
    ..addCommand('check-auth');

  Future<void> run(List<String> args) async {
    if (args.isEmpty) {
      _printUsage();
      exit(0);
    }

    final command = args.first;

    switch (command) {
      case 'add-usr':
        await _addUsr();
        break;
      case 'login':
        await _login();
        break;
      case 'check-auth':
        await _checkAuth();
        break;
      default:
        print('Unknown command: $command');
        break;
    }
    stdout.write('\n...');
    final wait = stdin.readLineSync()?.trim() ?? '';
    stdout.write('\x1B[2J\x1B[0;0H');
  }

  Future<void> _addUsr() async {
    print('Adding new usr to server...\n');

    stdout.write('Enter usr: ');
    final usr = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Enter psw: ');
    final psw = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Enter a type:\n1 - ADM\n 2 - MOTOBOY\n3 - OWNER\n: ');
    final type = stdin.readLineSync()?.trim() ?? '';

    try {
      await AuthService.createUsr(Usr(
          id: Utils.generateRandomString(12),
          usr: usr,
          psw: psw,
          usrType: int.tryParse(type) ?? 0));
      print('SUCESS');
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> _login() async {
    print('Login to server...\n');

    stdout.write('Enter usr: ');
    final usr = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Enter psw: ');
    final psw = stdin.readLineSync()?.trim() ?? '';

    try {
      final l = await AuthService.login(usr, psw);
      print('SUCESS \n$l');
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> _checkAuth() async {
    print('Checking Auth to server...\n');

    stdout.write('Enter token: \n');
    final token = stdin.readLineSync()?.trim() ?? '';

    try {
      final l = await AuthService.getUsrByToken(token);
      print('SUCESS \n${l.usr}\n${l.psw}');
    } catch (err) {
      print(err.toString());
    }
  }

  void _printUsage() {
    print('Usage: dart cli.dart <command>');
    print(parser.usage);
    exit(0);
  }
}
