import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import '../../core/exceptions.dart';
import '../../services/auth_service.dart';
import '../models/usr.dart';

typedef JSON = Map<String, dynamic>;

class ApiServer {
  ApiServer._internal();
  static final ApiServer _instance = ApiServer._internal();
  factory ApiServer() {
    return _instance;
  }

  Router? router;
  HttpServer? server;

  static Future startServer() async {
    _instance.router = Router();
    _instance.registerRoutes(_instance.router!);

    final handler =
        Pipeline().addMiddleware(logRequests()).addHandler(_instance.router!);
    _instance.server = await io.serve(handler, '0.0.0.0', 8080);
    print(
        'Server running on http://${_instance.server?.address.host}:${_instance.server?.port}');
  }

  static stopServer() async {
    await _instance.server!.close(force: true);
  }

  void registerRoutes(Router router) {
    /// [POST]
    router.post('/login', (Request req) async {
      try {
        JSON j = await decodeBody(req);
        Usr t = await AuthService.login(j['usr'], j['psw']);
        return Response.ok(
          jsonEncode({'token': t, 'usr_type': t.usrType}),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (err) {
        return Response.internalServerError(
          body: jsonEncode({'err': err.toString()}),
          headers: {'Content-Type': 'application/json'},
        );
      }
    });
  }

  Future<JSON> decodeBody(Request r) async {
    final payload = await r.readAsString();
    try {
      final data = jsonDecode(payload) as JSON;
      return data;
    } catch (err) {
      throw BodyIsNotJson(payload);
    }
  }
}
