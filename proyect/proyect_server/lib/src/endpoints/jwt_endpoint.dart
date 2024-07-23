import 'package:proyect_server/src/models/environment/env.dart';
import 'package:serverpod/serverpod.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JwtEndpoint extends Endpoint{

  Future<void> handleRequest(Session session) async{
  }
}








class JwtUtils {
  static final String _secretKey = 'your_secret_key';

  static String generateToken(Map<String, dynamic> payload) {
    final jwt = JWT(payload);
    return jwt.sign(SecretKey(_secretKey));
  }

  static JWT? verifyToken(String token) {
    try {
      return JWT.verify(token, SecretKey(_secretKey));
    } catch (e) {
      return null;
    }
  }
}