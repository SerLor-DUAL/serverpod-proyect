import 'dart:math';
import 'package:serverpod/serverpod.dart';
import 'package:proyect_server/src/generated/protocol.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.

  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter.
  // `bool`, `int`, `double`, `String`, `UuidValue`, `Duration`, `DateTime`, `ByteData`,
  // and other serializable classes, exceptions and enums from your from your `protocol` directory.
  // The methods should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.


class PasswordGeneratorEndpoint extends Endpoint 
{

  Future<String> createPassword(Session session, PasswordOptions options, { String? passwordInput } ) async 
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

  // ---------------------------------------------------------------------------------------------------------------- //

  Future<String> _passwordAutomaticCreation(PasswordOptions options) async
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

