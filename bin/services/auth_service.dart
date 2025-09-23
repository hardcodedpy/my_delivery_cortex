import '../data/models/usr.dart';
import '../data/service/hive_service.dart';
import '../core/utils.dart';
import '../core/exceptions.dart';

typedef TOKEN = String;

class AuthService {
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService() {
    return _instance;
  }

  static Future updateUsr(Usr usr) async {
    try {
      Usr? u = await HiveService.getUsrById(usr.id);
      if (u == null) {
        throw UsrNotFind();
      } else {
        await HiveService.updateUsr(usr);
      }
    } on AuthException {
      rethrow;
    } catch (err) {
      throw GenAuthErr();
    }
  }

  static Future<TOKEN> login(String usr, String psw) async {
    try {
      Usr? u = await HiveService.getUsrByUsr(usr);
      if (u == null) {
        throw UsrNotFind();
      } else {
        if (u.psw == psw) {
          TOKEN token = Utils.generateRandomString(12);
          await HiveService.updateUsr(u.copyWith(token: token));
          return token;
        } else {
          throw IncorrectPassword();
        }
      }
    } on AuthException {
      rethrow;
    } catch (err) {
      throw GenAuthErr();
    }
  }

  static Future<Usr> getUsrByToken(TOKEN token) async {
    try {
      Usr? u = await HiveService.getUsrByToken(token);
      if (u == null) {
        throw UsrNotFind();
      } else {
        return u;
      }
    } on AuthException {
      rethrow;
    } catch (err) {
      throw GenAuthErr();
    }
  }
}
