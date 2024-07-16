import 'package:serverpod/serverpod.dart';
import 'package:proyect_server/src/generated/protocol.dart';

class PasswordOptionsEndpoint extends Endpoint 
{

  Future<PasswordOptions?> getOptions(Session session, int optionsID) async 
  {
      return await PasswordOptions.db.findById(session, optionsID);
  }

  Future<void> updateOptions(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.updateRow(session, options);
  }

  Future<void> createOptions(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.insertRow(session, options);
  }

  Future<void> deleteOptions(Session session, PasswordOptions options) async 
  {
    await PasswordOptions.db.deleteRow(session, options);
  }
  
}
