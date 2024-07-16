import 'package:serverpod/serverpod.dart';
import 'package:proyect_server/src/generated/protocol.dart';
import 'dart:math';

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
