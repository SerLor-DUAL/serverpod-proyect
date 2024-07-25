import 'package:proyect_server/src/endpoints/users/users_registry_endpoint.dart';
import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AuthenticatedEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  
  Future<void> logout(Session session) async {
    await UserAuthentication.signOutUser(session);
  }
  // GETS OUR USER IF WAS AUTHENTICATED BEFORE.
  Future<UsersRegistry?> getUserIfAuth(Session session) async {
    var authentication = await session.authenticated;
    UsersRegistry? user;
    if (authentication != null){
      user = await UsersRegistry.db.findFirstRow(session,
                                                  where: (userRegistry) => userRegistry.id.equals(authentication.userId));
    }
    return user;
    }
    // Continue with your method implementation...
  }

  
