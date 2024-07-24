
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AuthenticatedEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  
  Future<void> logout(Session session) async {
    await UserAuthentication.signOutUser(session);
  }
}