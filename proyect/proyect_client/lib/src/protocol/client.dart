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
import 'package:proyect_client/src/protocol/users_sergio/password_generator.dart'
    as _i4;
import 'package:proyect_client/src/protocol/users_sergio/password_options.dart'
    as _i5;
import 'package:proyect_client/src/protocol/users_sergio/users_registry.dart'
    as _i6;
import 'protocol.dart' as _i7;

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

  _i2.Future<_i4.PasswordGenerator?> getPassword(_i4.PasswordGenerator pass) =>
      caller.callServerEndpoint<_i4.PasswordGenerator?>(
        'passwordGenerator',
        'getPassword',
        {'pass': pass},
      );

  _i2.Future<void> updatePassword(_i4.PasswordGenerator pass) =>
      caller.callServerEndpoint<void>(
        'passwordGenerator',
        'updatePassword',
        {'pass': pass},
      );

  _i2.Future<void> createPassword(
    _i5.PasswordOptions options, {
    String? passwordInput,
  }) =>
      caller.callServerEndpoint<void>(
        'passwordGenerator',
        'createPassword',
        {
          'options': options,
          'passwordInput': passwordInput,
        },
      );

  _i2.Future<void> deletePassword(_i4.PasswordGenerator pass) =>
      caller.callServerEndpoint<void>(
        'passwordGenerator',
        'deletePassword',
        {'pass': pass},
      );
}

/// {@category Endpoint}
class EndpointPasswordOptions extends _i1.EndpointRef {
  EndpointPasswordOptions(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'passwordOptions';

  _i2.Future<_i5.PasswordOptions?> getOptions(_i5.PasswordOptions options) =>
      caller.callServerEndpoint<_i5.PasswordOptions?>(
        'passwordOptions',
        'getOptions',
        {'options': options},
      );

  _i2.Future<void> updateOptions(_i5.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'updateOptions',
        {'options': options},
      );

  _i2.Future<void> createOptions(_i5.PasswordOptions options) =>
      caller.callServerEndpoint<void>(
        'passwordOptions',
        'createOptions',
        {'options': options},
      );

  _i2.Future<void> deleteOptions(_i5.PasswordOptions options) =>
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

  _i2.Future<List<_i6.UsersRegistry>> getAllUsers() =>
      caller.callServerEndpoint<List<_i6.UsersRegistry>>(
        'usersRegistry',
        'getAllUsers',
        {},
      );

  _i2.Future<_i6.UsersRegistry?> getUserById(_i6.UsersRegistry user) =>
      caller.callServerEndpoint<_i6.UsersRegistry?>(
        'usersRegistry',
        'getUserById',
        {'user': user},
      );

  _i2.Future<void> updateUser(_i6.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'updateUser',
        {'user': user},
      );

  _i2.Future<void> createUser(_i6.UsersRegistry user) =>
      caller.callServerEndpoint<void>(
        'usersRegistry',
        'createUser',
        {'user': user},
      );

  _i2.Future<void> deleteUser(_i6.UsersRegistry user) =>
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
          _i7.Protocol(),
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
