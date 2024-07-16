import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UsersRegistryEndpoint extends Endpoint 
{
  Future<List<UsersRegistry>> getAllUsers(Session session) async 
  {
    // By ordering by the id column, we always get the users in the same order and not in the order they were updated.
    return await UsersRegistry.db.find(
      session, 
      orderBy: (userRegistry) => userRegistry.id);
  }

  Future<UsersRegistry?> getUserById(Session session, UsersRegistry user) async 
  {
    return await UsersRegistry.db.findById(session, user.id!);
  }

  Future<void> updateUser(Session session, UsersRegistry user) async 
  {
    await UsersRegistry.db.updateRow(session, user);
  }

  Future<void> createUser(Session session, UsersRegistry user) async 
  {
    await UsersRegistry.db.insertRow(session, user);
  }

  Future<void> deleteUser(Session session, UsersRegistry user) async 
  {
    await UsersRegistry.db.deleteRow(session, user);
  }
  
}
