/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/todo_list_santi/tasks_endpoint.dart' as _i2;
import '../endpoints/users_sergio/password_generator.dart' as _i3;
import '../endpoints/users_sergio/password_options.dart' as _i4;
import '../endpoints/users_sergio/users_registry.dart' as _i5;
import 'package:proyect_server/src/generated/todo_list_santi/tasks.dart' as _i6;
import 'package:proyect_server/src/generated/users_sergio/password_options.dart'
    as _i7;
import 'package:proyect_server/src/generated/users_sergio/users_registry.dart'
    as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'tasks': _i2.TasksEndpoint()
        ..initialize(
          server,
          'tasks',
          null,
        ),
      'passwordGenerator': _i3.PasswordGeneratorEndpoint()
        ..initialize(
          server,
          'passwordGenerator',
          null,
        ),
      'passwordOptions': _i4.PasswordOptionsEndpoint()
        ..initialize(
          server,
          'passwordOptions',
          null,
        ),
      'usersRegistry': _i5.UsersRegistryEndpoint()
        ..initialize(
          server,
          'usersRegistry',
          null,
        ),
    };
    connectors['tasks'] = _i1.EndpointConnector(
      name: 'tasks',
      endpoint: endpoints['tasks']!,
      methodConnectors: {
        'addTask': _i1.MethodConnector(
          name: 'addTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i6.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).addTask(
            session,
            params['task'],
          ),
        ),
        'addListOfTasks': _i1.MethodConnector(
          name: 'addListOfTasks',
          params: {
            'tasks': _i1.ParameterDescription(
              name: 'tasks',
              type: _i1.getType<List<_i6.Task>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).addListOfTasks(
            session,
            params['tasks'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'taskID': _i1.ParameterDescription(
              name: 'taskID',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).findById(
            session,
            params['taskID'],
          ),
        ),
        'getEveryTask': _i1.MethodConnector(
          name: 'getEveryTask',
          params: {
            'idUser': _i1.ParameterDescription(
              name: 'idUser',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).getEveryTask(
            session,
            params['idUser'],
          ),
        ),
        'getEveryTaskByDeadLineASC': _i1.MethodConnector(
          name: 'getEveryTaskByDeadLineASC',
          params: {
            'idUser': _i1.ParameterDescription(
              name: 'idUser',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint)
                  .getEveryTaskByDeadLineASC(
            session,
            params['idUser'],
          ),
        ),
        'getEveryTaskByDeadLineDES': _i1.MethodConnector(
          name: 'getEveryTaskByDeadLineDES',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint)
                  .getEveryTaskByDeadLineDES(session),
        ),
        'updateTask': _i1.MethodConnector(
          name: 'updateTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i6.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).updateTask(
            session,
            params['task'],
          ),
        ),
        'toogleComplete': _i1.MethodConnector(
          name: 'toogleComplete',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i6.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).toogleComplete(
            session,
            params['task'],
          ),
        ),
        'deleteTask': _i1.MethodConnector(
          name: 'deleteTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i6.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).deleteTask(
            session,
            params['task'],
          ),
        ),
        'deleteMultipleTasks': _i1.MethodConnector(
          name: 'deleteMultipleTasks',
          params: {
            'tasks': _i1.ParameterDescription(
              name: 'tasks',
              type: _i1.getType<List<_i6.Task>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i2.TasksEndpoint).deleteMultipleTasks(
            session,
            params['tasks'],
          ),
        ),
      },
    );
    connectors['passwordGenerator'] = _i1.EndpointConnector(
      name: 'passwordGenerator',
      endpoint: endpoints['passwordGenerator']!,
      methodConnectors: {
        'createPassword': _i1.MethodConnector(
          name: 'createPassword',
          params: {
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i7.PasswordOptions>(),
              nullable: false,
            ),
            'passwordInput': _i1.ParameterDescription(
              name: 'passwordInput',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordGenerator'] as _i3.PasswordGeneratorEndpoint)
                  .createPassword(
            session,
            params['options'],
            passwordInput: params['passwordInput'],
          ),
        )
      },
    );
    connectors['passwordOptions'] = _i1.EndpointConnector(
      name: 'passwordOptions',
      endpoint: endpoints['passwordOptions']!,
      methodConnectors: {
        'getOptions': _i1.MethodConnector(
          name: 'getOptions',
          params: {
            'optionsID': _i1.ParameterDescription(
              name: 'optionsID',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i4.PasswordOptionsEndpoint)
                  .getOptions(
            session,
            params['optionsID'],
          ),
        ),
        'updateOptions': _i1.MethodConnector(
          name: 'updateOptions',
          params: {
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i7.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i4.PasswordOptionsEndpoint)
                  .updateOptions(
            session,
            params['options'],
          ),
        ),
        'createOptions': _i1.MethodConnector(
          name: 'createOptions',
          params: {
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i7.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i4.PasswordOptionsEndpoint)
                  .createOptions(
            session,
            params['options'],
          ),
        ),
        'deleteOptions': _i1.MethodConnector(
          name: 'deleteOptions',
          params: {
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i7.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i4.PasswordOptionsEndpoint)
                  .deleteOptions(
            session,
            params['options'],
          ),
        ),
      },
    );
    connectors['usersRegistry'] = _i1.EndpointConnector(
      name: 'usersRegistry',
      endpoint: endpoints['usersRegistry']!,
      methodConnectors: {
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i5.UsersRegistryEndpoint)
                  .getAllUsers(session),
        ),
        'getUserById': _i1.MethodConnector(
          name: 'getUserById',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i5.UsersRegistryEndpoint)
                  .getUserById(
            session,
            params['userId'],
          ),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i8.UsersRegistry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i5.UsersRegistryEndpoint)
                  .updateUser(
            session,
            params['user'],
          ),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'userName': _i1.ParameterDescription(
              name: 'userName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i7.PasswordOptions>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i5.UsersRegistryEndpoint)
                  .createUser(
            session,
            params['userName'],
            params['options'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i8.UsersRegistry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i5.UsersRegistryEndpoint)
                  .deleteUser(
            session,
            params['user'],
          ),
        ),
      },
    );
  }
}
