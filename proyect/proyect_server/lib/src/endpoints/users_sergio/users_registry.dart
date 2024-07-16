import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'dart:math';

class UsersRegistryEndpoint extends Endpoint 
{
  Future<List<UsersRegistry>> getAllUsers(Session session) async 
  {
    // By ordering by the id column, we always get the users in the same order and not in the order they were updated.
    return await UsersRegistry.db.find(
      session, 
      orderBy: (userRegistry) => userRegistry.id);
  }

  Future<UsersRegistry?> getUserById(Session session, int userId) async 
  {
    return await UsersRegistry.db.findById(session, userId);
  }

  Future<void> updateUser(Session session, UsersRegistry user) async 
  {
    if(user.id != null)
    {
      await UsersRegistry.db.updateRow(session, user);
    }
    else
    {
      throw Exception('User with selected ID not found.');
    }
  }

  Future<UsersRegistry> createUser(Session session, String userName, PasswordOptions options) async 
  {
    UsersRegistry createdUser = UsersRegistry(userName: userName,
                                              userPassword: createPassword(options),
                                              options: options.id!);

    await UsersRegistry.db.insertRow(session, createdUser);
    return createdUser;
  }

  Future<void> deleteUser(Session session, UsersRegistry user) async 
  {
    if(user.id != null)
    {
      await UsersRegistry.db.deleteRow(session, user);
    }
    else
    {
      throw Exception('User with selected ID not found.');
    }
  }
   
  // ---------------------------------------------------------------------------------------------------------------- //
    // PASSWORDGENERATOR
    String createPassword(PasswordOptions options, { String? passwordInput } )
    {
      var automated = options.automatedPassword;

      if(automated)
      {
        return _passwordAutomaticCreation(options);
      }
      else
      {
        if(passwordInput != null)
        {
          return passwordInput;
        }
        else
        {
          throw Exception('Password input cannot be null for a manual password mode');
        }
      }
    }

    String _passwordAutomaticCreation(PasswordOptions options)
    {
      Random randChoice = Random.secure();

      // LISTAS DE CARÁCTERES POSIBLES PARA LA GENERACIÓN
      final List<String> lowercaseList = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','ñ','o',
                                          'p','q','r','s','t','u','v','w','x','y','z'];

      final List<String> uppercaseList = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O',
                                          'P','Q','R','S','T','U','V','W','X','Y','Z'];

      final List<String> specialsList = ['!', '@', '#', '\$', '%', '^', 'ç','&', '*', '(', ')', '-', '_', 
                                          '=', '+', ';', ':', '.', '<', '>', '?'];

      final List<String> numbersList = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];


      // AÑADIR LOS CARÁCTERES A UNA NUEVA LISTA DESDE OTRAS LISTAS
      List<String> passwordChars = List.from(lowercaseList);
      if (options.upperOption!) passwordChars.addAll(uppercaseList); 
      if (options.numberOption!) passwordChars.addAll(numbersList);
      if (options.specialOption!) passwordChars.addAll(specialsList);

      // MEZCLA EL RESULTADO DE TODAS LAS LISTAS Y PROCEDE A ELEGIR LOS PRIMEROS X NUMEROS 
      // DEPENDIENDO DE LA LONGITUD DESEADA DE LA CONTRASEÑA
      passwordChars.shuffle(randChoice);
      return passwordChars.take(options.passwordLengthOption!).join('');
    }

}
