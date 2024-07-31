/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:proyect_shared_sergio/src/generic_api_response.dart' as _i3;
import 'package:proyect_shared_santiago/src/message_response.dart' as _i4;
import 'package:proyect_client/src/protocol/afilnet/afilnet_whatsapp_sergio_response.dart'
    as _i5;
import 'package:proyect_client/src/protocol/contacts/contacts.dart' as _i6;
import 'package:proyect_client/src/protocol/todolist/tasks.dart' as _i7;
import 'package:proyect_client/src/protocol/users/users_registry.dart' as _i8;
import 'package:proyect_client/src/protocol/users/password_options.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointAfilnetSms extends _i1.EndpointRef {
  EndpointAfilnetSms(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'afilnetSms';

  _i2.Future<_i3.GenericApiResponse> sendSms(
    String countryCode,
    String destinationPhone,
    String message, {
    DateTime? scheduleDateTime,
  }) =>
      caller.callServerEndpoint<_i3.GenericApiResponse>(
        'afilnetSms',
        'sendSms',
        {
          'countryCode': countryCode,
          'destinationPhone': destinationPhone,
          'message': message,
          'scheduleDateTime': scheduleDateTime,
        },
      );
}

/// {@category Endpoint}
class EndpointMessageApp extends _i1.EndpointRef {
  EndpointMessageApp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'messageApp';

  _i2.Future<_i4.MessageResponse> sendMessageWpp(
    String phoneNumber,
    String message,
  ) =>
      caller.callServerEndpoint<_i4.MessageResponse>(
        'messageApp',
        'sendMessageWpp',
        {
          'phoneNumber': phoneNumber,
          'message': message,
        },
      );

  _i2.Future<_i4.MessageResponse> sendMessageSMS(
    String username,
    String phoneNumber,
    String message,
  ) =>
      caller.callServerEndpoint<_i4.MessageResponse>(
        'messageApp',
        'sendMessageSMS',
        {
          'username': username,
          'phoneNumber': phoneNumber,
          'message': message,
        },
      );
}

/// {@category Endpoint}
class EndpointAfilnetWhatsApp extends _i1.EndpointRef {
  EndpointAfilnetWhatsApp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'afilnetWhatsApp';

  _i2.Future<_i5.AfilnetWhatsAppSergioResponse> sendMessage(
    String destination,
    String message,
  ) =>
      caller.callServerEndpoint<_i5.AfilnetWhatsAppSergioResponse>(
        'afilnetWhatsApp',
        'sendMessage',
        {
          'destination': destination,
          'message': message,
        },
      );
}

/// {@category Endpoint}
class EndpointContact extends _i1.EndpointRef {
  EndpointContact(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'contact';

  _i2.Future<void> addContact(_i6.Contact contact) =>
      caller.callServerEndpoint<void>(
        'contact',
        'addContact',
        {'contact': contact},
      );

  _i2.Future<void> addListOfContacts(List<_i6.Contact> contacts) =>
      caller.callServerEndpoint<void>(
        'contact',
        'addListOfContacts',
        {'contacts': contacts},
      );

  _i2.Future<_i6.Contact?> findById(int contactID) =>
      caller.callServerEndpoint<_i6.Contact?>(
        'contact',
        'findById',
        {'contactID': contactID},
      );

  _i2.Future<List<_i6.Contact>> getEveryContactByUser(int userID) =>
      caller.callServerEndpoint<List<_i6.Contact>>(
        'contact',
        'getEveryContactByUser',
        {'userID': userID},
      );

  _i2.Future<bool> isContactOnList(
    String phoneNumber,
    int userID,
  ) =>
      caller.callServerEndpoint<bool>(
        'contact',
        'isContactOnList',
        {
          'phoneNumber': phoneNumber,
          'userID': userID,
        },
      );

  _i2.Future<void> updateContact(_i6.Contact? contact) =>
      caller.callServerEndpoint<void>(
        'contact',
        'updateContact',
        {'contact': contact},
      );

  _i2.Future<void> deleteContact(_i6.Contact contact) =>
      caller.callServerEndpoint<void>(
        'contact',
        'deleteContact',
        {'contact': contact},
      );

  _i2.Future<void> deleteMultipleContacts(List<_i6.Contact> tasks) =>
      caller.callServerEndpoint<void>(
        'contact',
        'deleteMultipleContacts',
        {'tasks': tasks},
      );
}

/// {@category Endpoint}
class EndpointTasks extends _i1.EndpointRef {
  EndpointTasks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tasks';

  _i2.Future<void> addTask(_i7.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'addTask',
        {'task': task},
      );

  _i2.Future<void> addListOfTasks(List<_i7.Task> tasks) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'addListOfTasks',
        {'tasks': tasks},
      );

  _i2.Future<_i7.Task?> findById(int taskID) =>
      caller.callServerEndpoint<_i7.Task?>(
        'tasks',
        'findById',
        {'taskID': taskID},
      );

  _i2.Future<List<_i7.Task>> getEveryTaskByUser(int userID) =>
      caller.callServerEndpoint<List<_i7.Task>>(
        'tasks',
        'getEveryTaskByUser',
        {'userID': userID},
      );

  _i2.Future<List<_i7.Task>> getEveryTaskByDeadLineASC(int idUser) =>
      caller.callServerEndpoint<List<_i7.Task>>(
        'tasks',
        'getEveryTaskByDeadLineASC',
        {'idUser': idUser},
      );

  _i2.Future<List<_i7.Task>> getEveryTaskByDeadLineDES() =>
      caller.callServerEndpoint<List<_i7.Task>>(
        'tasks',
        'getEveryTaskByDeadLineDES',
        {},
      );

  _i2.Future<void> updateTask(_i7.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'updateTask',
        {'task': task},
      );

  _i2.Future<void> toogleComplete(_i7.Task task) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'toogleComplete',
        {'task': task},
      );

  _i2.Future<void> deleteTask(_i7.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'deleteTask',
        {'task': task},
      );

  _i2.Future<void> deleteMultipleTasks(List<_i7.Task> tasks) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'deleteMultipleTasks',
        {'tasks': tasks},
      );
}

/// {@category Endpoint}
class EndpointAuthenticated extends _i1.EndpointRef {
  EndpointAuthenticated(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'authenticated';

  _i2.Future<void> logout() => caller.callServerEndpoint<void>(
        'authenticated',
        'logout',
        {},
      );

  _i2.Future<_i8.UsersRegistry?> getUserIfAuth() =>
      caller.callServerEndpoint<_i8.UsersRegistry?>(
        'authenticated',
        'getUserIfAuth',
        {},
      );
}

/// {@category Endpoint}
class EndpointPasswordGenerator extends _i1.EndpointRef {
  EndpointPasswordGenerator(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'passwordGenerator';

  _i2.Future<String> createPassword(
    _i9.PasswordOptions options, {
    String? passwordInput,
  }) =>
      caller.callServerEndpoint<String>(
        'passwordGenerator',
        'createPassword',
        {
          'options': options,
          'passwordInput': passwordInput,
        },
      );
}

/// {@category Endpoint}
class EndpointPasswordOptions extends _i1.EndpointRef {
  EndpointPasswordOptions(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'passwordOptions';

  _i2.Future<_i9.PasswordOptions?> getOptions(int optionsID) =>
      caller.callServerEndpoint<_i9.PasswordOptions?>(
        'passwordOptions',
        'getOptions',
        {'optionsID': optionsID},
      );

  _i2.Future<_i9.PasswordOptions?> getLastID() =>
      caller.callServerEndpoint<_i9.PasswordOptions?>(
        'passwordOptions',
        'getLastID',
        {},
      );

  _i2.Future<void> updateOptions(_i9.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'updateOptions',
        {'options': options},
      );

  _i2.Future<void> createOptions(_i9.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'createOptions',
        {'options': options},
      );

  _i2.Future<void> deleteOptions(_i9.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'deleteOptions',
        {'options': options},
      );
}

/// {@category Endpoint}
class EndpointUsersRegistry extends _i1.EndpointRef {
  EndpointUsersRegistry(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'usersRegistry';

  _i2.Future<List<_i8.UsersRegistry>> getAllUsers() =>
      caller.callServerEndpoint<List<_i8.UsersRegistry>>(
        'usersRegistry',
        'getAllUsers',
        {},
      );

  _i2.Future<_i8.UsersRegistry?> getUserById(int userId) =>
      caller.callServerEndpoint<_i8.UsersRegistry?>(
        'usersRegistry',
        'getUserById',
        {'userId': userId},
      );

  _i2.Future<_i10.UserInfo?> getUserInfoById(int userInfoId) =>
      caller.callServerEndpoint<_i10.UserInfo?>(
        'usersRegistry',
        'getUserInfoById',
        {'userInfoId': userInfoId},
      );

  _i2.Future<_i8.UsersRegistry?> getUserByName(String name) =>
      caller.callServerEndpoint<_i8.UsersRegistry?>(
        'usersRegistry',
        'getUserByName',
        {'name': name},
      );

  _i2.Future<bool> checkUserExistanceByName(String name) =>
      caller.callServerEndpoint<bool>(
        'usersRegistry',
        'checkUserExistanceByName',
        {'name': name},
      );

  _i2.Future<_i8.UsersRegistry?> getLastUserID() =>
      caller.callServerEndpoint<_i8.UsersRegistry?>(
        'usersRegistry',
        'getLastUserID',
        {},
      );

  _i2.Future<void> updateUser(_i8.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'updateUser',
        {'user': user},
      );

  _i2.Future<void> updateUserInfo(_i10.UserInfo userInfo) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'updateUserInfo',
        {'userInfo': userInfo},
      );

  _i2.Future<_i8.UsersRegistry> createUser(
    String name,
    _i9.PasswordOptions selectedUserOptions, {
    String? selectedUserPassword,
  }) =>
      caller.callServerEndpoint<_i8.UsersRegistry>(
        'usersRegistry',
        'createUser',
        {
          'name': name,
          'selectedUserOptions': selectedUserOptions,
          'selectedUserPassword': selectedUserPassword,
        },
      );

  _i2.Future<void> deleteUser(_i8.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'deleteUser',
        {'user': user},
      );

  _i2.Future<_i10.AuthenticationResponse> login(
    String username,
    String password,
  ) =>
      caller.callServerEndpoint<_i10.AuthenticationResponse>(
        'usersRegistry',
        'login',
        {
          'username': username,
          'password': password,
        },
      );

  _i2.Future<bool> authenticateUser(
    _i8.UsersRegistry? user,
    String password,
  ) =>
      caller.callServerEndpoint<bool>(
        'usersRegistry',
        'authenticateUser',
        {
          'user': user,
          'password': password,
        },
      );

  _i2.Future<bool> validatePassword(
    String password,
    String hashedPass,
  ) =>
      caller.callServerEndpoint<bool>(
        'usersRegistry',
        'validatePassword',
        {
          'password': password,
          'hashedPass': hashedPass,
        },
      );

  _i2.Future<_i10.UserInfo?> createUserInfo(String username) =>
      caller.callServerEndpoint<_i10.UserInfo?>(
        'usersRegistry',
        'createUserInfo',
        {'username': username},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i10.Caller(client);
  }

  late final _i10.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i11.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    afilnetSms = EndpointAfilnetSms(this);
    messageApp = EndpointMessageApp(this);
    afilnetWhatsApp = EndpointAfilnetWhatsApp(this);
    contact = EndpointContact(this);
    tasks = EndpointTasks(this);
    authenticated = EndpointAuthenticated(this);
    passwordGenerator = EndpointPasswordGenerator(this);
    passwordOptions = EndpointPasswordOptions(this);
    usersRegistry = EndpointUsersRegistry(this);
    modules = _Modules(this);
  }

  late final EndpointAfilnetSms afilnetSms;

  late final EndpointMessageApp messageApp;

  late final EndpointAfilnetWhatsApp afilnetWhatsApp;

  late final EndpointContact contact;

  late final EndpointTasks tasks;

  late final EndpointAuthenticated authenticated;

  late final EndpointPasswordGenerator passwordGenerator;

  late final EndpointPasswordOptions passwordOptions;

  late final EndpointUsersRegistry usersRegistry;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'afilnetSms': afilnetSms,
        'messageApp': messageApp,
        'afilnetWhatsApp': afilnetWhatsApp,
        'contact': contact,
        'tasks': tasks,
        'authenticated': authenticated,
        'passwordGenerator': passwordGenerator,
        'passwordOptions': passwordOptions,
        'usersRegistry': usersRegistry,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
