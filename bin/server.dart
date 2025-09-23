import './data/service/hive_service.dart';

class Server {
  Server._internal();
  static final Server _instance = Server._internal();
  factory Server() {
    return _instance;
  }

  static start() {
    HiveService.init();
  }
}
