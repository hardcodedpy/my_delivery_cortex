import 'dart:math';

class Utils {
  static String generateRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure(); // mais seguro que Random()
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
