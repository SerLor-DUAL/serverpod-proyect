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
import 'package:proyect_client/src/protocol/todo_list_santi/tasks.dart' as _i3;
import 'package:proyect_client/src/protocol/users_sergio/password_options.dart'
    as _i4;
import 'package:proyect_client/src/protocol/users_sergio/users_registry.dart'
    as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointTasks extends _i1.EndpointRef {
  EndpointTasks(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tasks';

  _i2.Future<void> addTask(_i3.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'addTask',
        {'task': task},
      );

  _i2.Future<void> addListOfTasks(List<_i3.Task> tasks) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'addListOfTasks',
        {'tasks': tasks},
      );

  _i2.Future<_i3.Task?> findById(int taskID) =>
      caller.callServerEndpoint<_i3.Task?>(
        'tasks',
        'findById',
        {'taskID': taskID},
      );

  _i2.Future<List<_i3.Task>> getEveryTask(int idUser) =>
      caller.callServerEndpoint<List<_i3.Task>>(
        'tasks',
        'getEveryTask',
        {'idUser': idUser},
      );

  _i2.Future<List<_i3.Task>> getEveryTaskByDeadLineASC(int idUser) =>
      caller.callServerEndpoint<List<_i3.Task>>(
        'tasks',
        'getEveryTaskByDeadLineASC',
        {'idUser': idUser},
      );

  _i2.Future<List<_i3.Task>> getEveryTaskByDeadLineDES() =>
      caller.callServerEndpoint<List<_i3.Task>>(
        'tasks',
        'getEveryTaskByDeadLineDES',
        {},
      );

  _i2.Future<void> updateTask(_i3.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'updateTask',
        {'task': task},
      );

  _i2.Future<void> toogleComplete(_i3.Task task) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'toogleComplete',
        {'task': task},
      );

  _i2.Future<void> deleteTask(_i3.Task task) => caller.callServerEndpoint<void>(
        'tasks',
        'deleteTask',
        {'task': task},
      );

  _i2.Future<void> deleteMultipleTasks(List<_i3.Task> tasks) =>
      caller.callServerEndpoint<void>(
        'tasks',
        'deleteMultipleTasks',
        {'tasks': tasks},
      );
}

/// {@category Endpoint}
class EndpointPasswordGenerator extends _i1.EndpointRef {
  EndpointPasswordGenerator(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'passwordGenerator';

  _i2.Future<String> createPassword(
    _i4.PasswordOptions options, {
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

  _i2.Future<_i4.PasswordOptions?> getOptions(int optionsID) =>
      caller.callServerEndpoint<_i4.PasswordOptions?>(
        'passwordOptions',
        'getOptions',
        {'optionsID': optionsID},
      );

  _i2.Future<_i4.PasswordOptions?> getLastID() =>
      caller.callServerEndpoint<_i4.PasswordOptions?>(
        'passwordOptions',
        'getLastID',
        {},
      );

  _i2.Future<void> updateOptions(_i4.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'updateOptions',
        {'options': options},
      );

  _i2.Future<void> createOptions(_i4.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'createOptions',
        {'options': options},
      );

  _i2.Future<void> deleteOptions(_i4.PasswordOptions options) =>
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

  _i2.Future<List<_i5.UsersRegistry>> getAllUsers() =>
      caller.callServerEndpoint<List<_i5.UsersRegistry>>(
        'usersRegistry',
        'getAllUsers',
        {},
      );

  _i2.Future<_i5.UsersRegistry?> getUserById(int userId) =>
      caller.callServerEndpoint<_i5.UsersRegistry?>(
        'usersRegistry',
        'getUserById',
        {'userId': userId},
      );

  _i2.Future<_i5.UsersRegistry?> getUserByName(String name) =>
      caller.callServerEndpoint<_i5.UsersRegistry?>(
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

  _i2.Future<_i5.UsersRegistry?> getLastUserID() =>
      caller.callServerEndpoint<_i5.UsersRegistry?>(
        'usersRegistry',
        'getLastUserID',
        {},
      );

  _i2.Future<void> updateUser(_i5.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'updateUser',
        {'user': user},
      );

  _i2.Future<_i5.UsersRegistry> createUser(
    String name,
    _i4.PasswordOptions selectedUserOptions, {
    String? selectedUserPassword,
  }) =>
      caller.callServerEndpoint<_i5.UsersRegistry>(
        'usersRegistry',
        'createUser',
        {
          'name': name,
          'selectedUserOptions': selectedUserOptions,
          'selectedUserPassword': selectedUserPassword,
        },
      );

  _i2.Future<void> deleteUser(_i5.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'deleteUser',
        {'user': user},
      );
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    tasks = EndpointTasks(this);
    passwordGenerator = EndpointPasswordGenerator(this);
    passwordOptions = EndpointPasswordOptions(this);
    usersRegistry = EndpointUsersRegistry(this);
  }

  late final EndpointTasks tasks;

  late final EndpointPasswordGenerator passwordGenerator;

  late final EndpointPasswordOptions passwordOptions;

  late final EndpointUsersRegistry usersRegistry;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'tasks': tasks,
        'passwordGenerator': passwordGenerator,
        'passwordOptions': passwordOptions,
        'usersRegistry': usersRegistry,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
