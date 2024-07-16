import 'package:serverpod/serverpod.dart';
import 'package:proyect_server/src/generated/protocol.dart';

class PasswordOptionsEndpoint extends Endpoint 
{

  Future<PasswordOptions?> getOptions(Session session, PasswordOptions options) async 
  {
      return await PasswordOptions.db.findById(session, options.id!);
  }

  Future<void> updateOptions(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.updateRow(session, options);
  }

  Future<void> createUser(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.insertRow(session, options);
  }

  Future<void> deleteUser(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.deleteRow(session, options);
  }
  
}
