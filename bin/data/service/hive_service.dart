import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path/path.dart' as p;
import '../models/estabelecimento.dart';
import '../models/motoboy.dart';
import '../models/ordem_entrega.dart';
import '../models/usr.dart';

class HiveService {
  HiveService._internal();
  static final HiveService _instance = HiveService._internal();
  factory HiveService() {
    return _instance;
  }

  static const ESTABELECIMENTO_BOX = 'estabelecimento_box';
  static const MOTOBOY_BOX = 'motoboy_box';
  static const OE_BOX = 'oe_box';
  static const USR_BOX = 'usr_box';
  static const HIVE_FILE = 'hive_db';

  String? path;
  Box<Estabelecimento>? estabBox;
  Box<Motoboy>? motoBox;
  Box<OrdemEntrega>? oeBox;
  Box<Usr>? usrBox;

  static Future init() async {
    _instance.path =
        p.join(Directory.current.path, 'bin/data/outputs', HIVE_FILE);
    await Directory(_instance.path!).create(recursive: true);

    Hive.init(_instance.path);

    Hive.registerAdapter(EstabelecimentoAdapter());
    Hive.registerAdapter(MotoboyAdapter());
    Hive.registerAdapter(OrdemEntregaAdapter());
    Hive.registerAdapter(UsrAdapter());

    _instance.estabBox = await Hive.openBox(ESTABELECIMENTO_BOX);
    _instance.motoBox = await Hive.openBox(MOTOBOY_BOX);
    _instance.oeBox = await Hive.openBox(OE_BOX);
    _instance.usrBox = await Hive.openBox(USR_BOX);
  }

  /// [USR CRUD]
  static Future addUsr(Usr u) async {
    _instance.usrBox!.add(u);
  }

  static Future updateUsr(Usr u) async {
    _instance.usrBox!.put(u.key, u);
  }

  static Future<Usr?> getUsrById(String id) async {
    try {
      return _instance.usrBox!.values.toList().firstWhere((t) => t.id == id);
    } catch (err) {
      return null;
    }
  }

  static Future<Usr?> getUsrByUsr(String usr) async {
    try {
      return _instance.usrBox!.values.toList().firstWhere((t) => t.usr == usr);
    } catch (err) {
      return null;
    }
  }

  static Future<Usr?> getUsrByToken(String token) async {
    try {
      return _instance.usrBox!.values
          .toList()
          .firstWhere((t) => t.token == token);
    } catch (err) {
      return null;
    }
  }

  /// [estabelecimento CRUD]
  static Future addEstab(Estabelecimento e) async {
    _instance.estabBox!.add(e);
  }

  static Future getEstabById(String id) async {
    try {
      return _instance.estabBox!.values.toList().firstWhere((t) => t.id == id);
    } catch (err) {
      return;
    }
  }

  static Future getEstabByOwnerId(String idOwner) async {
    try {
      return _instance.estabBox!.values
          .toList()
          .firstWhere((t) => t.idOwner == idOwner);
    } catch (err) {
      return;
    }
  }

  /// [MOTOBOY CRUD]
  static Future addMotoB(Motoboy mB) async {
    _instance.motoBox!.add(mB);
  }

  static Future getMotoById(String id) async {
    try {
      return _instance.motoBox!.values.toList().firstWhere((t) => t.id == id);
    } catch (err) {
      return;
    }
  }

  static Future getMotoByUsrId(String usrId) async {
    try {
      return _instance.motoBox!.values
          .toList()
          .firstWhere((t) => t.idUsr == usrId);
    } catch (err) {
      return;
    }
  }

  /// [OE CRUD]
  static Future addOe(OrdemEntrega oE) async {
    _instance.oeBox!.add(oE);
  }

  static Future getOeById(String id) async {
    try {
      return _instance.oeBox!.values.toList().firstWhere((t) => t.id == id);
    } catch (err) {
      return;
    }
  }

  static Future<List<OrdemEntrega>> getOeByMotoboyId(String usrId) async {
    try {
      return _instance.oeBox!.values
          .toList()
          .where((t) => t.idMotoBoy == usrId)
          .toList();
    } catch (err) {
      return [];
    }
  }

  static Future<List<OrdemEntrega>> getOeByEstabId(String estabId) async {
    try {
      return _instance.oeBox!.values
          .toList()
          .where((t) => t.idEstabelecimento == estabId)
          .toList();
    } catch (err) {
      return [];
    }
  }
}
