import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'dart:math';
import 'package:bcrypt/bcrypt.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UsersRegistryEndpoint extends Endpoint {
  // CRUD METHODS:
  // READ
  Future<List<UsersRegistry>> getAllUsers(Session session) async {
    // By ordering by the id column, we always get the users in the same order and not in the order they were updated.
    return await UsersRegistry.db
        .find(session, orderBy: (userRegistry) => userRegistry.id);
  }

  Future<UsersRegistry?> getUserById(Session session, int userId) async {
    UsersRegistry? user = await UsersRegistry.db.findById(session, userId);

    return user;
  }

  Future<UsersRegistry?> getUserByName(Session session, String name) async {
    return await UsersRegistry.db.findFirstRow(session,
        where: (userRegistry) => userRegistry.userName.equals(name));
  }

  Future<bool> checkUserExistanceByName(Session session, String name) async {
    var existingUsers = await UsersRegistry.db.find(session,
        where: (userRegistry) => userRegistry.userName.equals(name));

    return existingUsers.isNotEmpty;
  }

  Future<UsersRegistry?> getLastUserID(Session session) async {
    return await UsersRegistry.db.findFirstRow(session,
        orderBy: (userRegistry) => userRegistry.id, orderDescending: true);
  }

  // UPDATE
  Future<void> updateUser(Session session, UsersRegistry user) async {
    if (user.id != null) {
      await UsersRegistry.db.updateRow(session, user);
    } else {
      throw Exception('User with selected ID not found.');
    }
  }

  // CREATE
  Future<UsersRegistry> createUser(
      Session session, String name, PasswordOptions selectedUserOptions,
      {String? selectedUserPassword}) async {
    
    // CREATE PASSWORD
    String? passwordGenerated = createPassword(selectedUserOptions,
        passwordInput: selectedUserPassword);
    String hashedPass = bcryptPassword(passwordGenerated);
    // CREATE USERINFO
    UserInfo? userInfo = await createUserInfo(session, name);
    // CREATE USERS
    UsersRegistry createdUser = UsersRegistry(
        userName: name,
        userPassword: hashedPass,
        options: selectedUserOptions.id!,
        userInfoId: userInfo!.id!
        );

    return await UsersRegistry.db.insertRow(session, createdUser);
  }

  // DELETE
  Future<void> deleteUser(Session session, UsersRegistry user) async {
    if (user.id != null) {
      await UsersRegistry.db.deleteRow(session, user);
    } else {
      throw Exception('User with selected ID not found.');
    }
  }

  Future<AuthenticationResponse> login(
      Session session, String username, String password) async {
    // Get a user that has the same username.
    UsersRegistry? user = await getUserByName(session, username);
    
    // Validate if that user is authentic
    bool isUserAuthentic = await authenticateUser(session, user, password);

    if (!isUserAuthentic) {
      return AuthenticationResponse(success: false);
    }
    // WE DON'T HAVE SCOPES BY NOW.
    var authToken = await UserAuthentication.signInUser(
        session, user!.id!, 'myAuthMethod',
        scopes: {},);
    // GET USER INFO
    UserInfo? userInfo = await UserInfo.db.findById(session, user.userInfoId);
    if (userInfo != null) {
      // GET AUTHENTICATIONRESPONSE TRUE.
      return AuthenticationResponse(
          success: true, 
          keyId: authToken.id, 
          key: authToken.key, 
          userInfo: userInfo);
    }
    return AuthenticationResponse(success: false);
    }

  Future<bool> authenticateUser(
      Session session, UsersRegistry? user, String password) async {
    bool isUserAuthentic = false;
    // If user is not null, validate the password.
    if (user != null) {
      bool isPasswordValid =
          await validatePassword(session, password, user.userPassword);
      if (isPasswordValid) {
        isUserAuthentic = true;
      }
    }
    return isUserAuthentic;
  }

  // ---------------------------------------------------------------------------------------------------------------- //
  // PASSWORDGENERATOR
  String createPassword(PasswordOptions options, {String? passwordInput}) {
    var automated = options.automatedPassword;

    if (automated) {
      return _passwordAutomaticCreation(options);
    } else {
      if (passwordInput != null) {
        return passwordInput;
      } else {
        throw Exception(
            'Password input cannot be null for a manual password mode');
      }
    }
  }

  String bcryptPassword(String pasword) {
    return BCrypt.hashpw(pasword, BCrypt.gensalt());
  }

  Future<bool> validatePassword(
      Session session, String password, String hashedPass) async {
    return (BCrypt.checkpw(password, hashedPass));
  }

  String _passwordAutomaticCreation(PasswordOptions options) {
    Random randChoice = Random.secure();

    // LISTAS DE CARÁCTERES POSIBLES PARA LA GENERACIÓN
    final List<String> lowercaseList = [
      'a','b','c','d','e','f','g','h','i',
      'j','k','l','m','n','ñ','o','p','q',
      'r','s','t','u','v','w','x','y','z'
    ];

    final List<String> uppercaseList = [
      'A','B','C','D','E','F','G','H','I',
      'J','K','L','M','N','Ñ','O','P','Q',
      'R','S','T','U','V','W','X','Y','Z'
    ];

    final List<String> specialsList = [
      '!','@','#','\$','%','^','ç',
      '&','*','(',')','-','_','=',
      '+',';',':','.','<','>','?'
    ];

    final List<String> numbersList = [
      '0','1','2','3','4',
      '5','6','7','8','9'
    ];

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

  Future<UserInfo?> createUserInfo(Session session, String username) async {
    // CREATE UserInfo
    UserInfo? userInfo = UserInfo(
        userIdentifier: username,
        created: DateTime.now(),
        scopeNames: [],
        blocked: false);
    // INSERT UserInfo to db
    await UserInfo.db.insertRow(session, userInfo);
    userInfo = await UserInfo.db.findFirstRow(session, 
                                              where: (userInfo) => userInfo.userIdentifier.equals(username));
    return userInfo;
  }
}
