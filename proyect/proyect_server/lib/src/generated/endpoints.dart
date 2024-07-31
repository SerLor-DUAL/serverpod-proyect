/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/afilnet/afilnet_sms_sergio_endpoint.dart' as _i2;
import '../endpoints/afilnet/afilnet_whatsapp_santiago_endpoint.dart' as _i3;
import '../endpoints/afilnet/afilnet_whatsapp_sergio_endpoint.dart' as _i4;
import '../endpoints/contact/contacts_endpoint.dart' as _i5;
import '../endpoints/todolist/tasks_endpoint.dart' as _i6;
import '../endpoints/users/authenticated_endpoint.dart' as _i7;
import '../endpoints/users/password_generator_endpoint.dart' as _i8;
import '../endpoints/users/password_options_endpoint.dart' as _i9;
import '../endpoints/users/users_registry_endpoint.dart' as _i10;
import 'package:proyect_server/src/generated/contacts/contacts.dart' as _i11;
import 'package:proyect_server/src/generated/todolist/tasks.dart' as _i12;
import 'package:proyect_server/src/generated/users/password_options.dart'
    as _i13;
import 'package:proyect_server/src/generated/users/users_registry.dart' as _i14;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i15;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'afilnetSms': _i2.AfilnetSmsEndpoint()
        ..initialize(
          server,
          'afilnetSms',
          null,
        ),
      'messageApp': _i3.MessageAppEndpoint()
        ..initialize(
          server,
          'messageApp',
          null,
        ),
      'afilnetWhatsApp': _i4.AfilnetWhatsAppEndpoint()
        ..initialize(
          server,
          'afilnetWhatsApp',
          null,
        ),
      'contact': _i5.ContactEndpoint()
        ..initialize(
          server,
          'contact',
          null,
        ),
      'tasks': _i6.TasksEndpoint()
        ..initialize(
          server,
          'tasks',
          null,
        ),
      'authenticated': _i7.AuthenticatedEndpoint()
        ..initialize(
          server,
          'authenticated',
          null,
        ),
      'passwordGenerator': _i8.PasswordGeneratorEndpoint()
        ..initialize(
          server,
          'passwordGenerator',
          null,
        ),
      'passwordOptions': _i9.PasswordOptionsEndpoint()
        ..initialize(
          server,
          'passwordOptions',
          null,
        ),
      'usersRegistry': _i10.UsersRegistryEndpoint()
        ..initialize(
          server,
          'usersRegistry',
          null,
        ),
    };
    connectors['afilnetSms'] = _i1.EndpointConnector(
      name: 'afilnetSms',
      endpoint: endpoints['afilnetSms']!,
      methodConnectors: {
        'sendSms': _i1.MethodConnector(
          name: 'sendSms',
          params: {
            'countryCode': _i1.ParameterDescription(
              name: 'countryCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'destinationPhone': _i1.ParameterDescription(
              name: 'destinationPhone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'scheduleDateTime': _i1.ParameterDescription(
              name: 'scheduleDateTime',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['afilnetSms'] as _i2.AfilnetSmsEndpoint).sendSms(
            session,
            params['countryCode'],
            params['destinationPhone'],
            params['message'],
            scheduleDateTime: params['scheduleDateTime'],
          ),
        )
      },
    );
    connectors['messageApp'] = _i1.EndpointConnector(
      name: 'messageApp',
      endpoint: endpoints['messageApp']!,
      methodConnectors: {
        'sendMessageWpp': _i1.MethodConnector(
          name: 'sendMessageWpp',
          params: {
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['messageApp'] as _i3.MessageAppEndpoint)
                  .sendMessageWpp(
            session,
            params['phoneNumber'],
            params['message'],
          ),
        ),
        'sendMessageSMS': _i1.MethodConnector(
          name: 'sendMessageSMS',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['messageApp'] as _i3.MessageAppEndpoint)
                  .sendMessageSMS(
            session,
            params['username'],
            params['phoneNumber'],
            params['message'],
          ),
        ),
      },
    );
    connectors['afilnetWhatsApp'] = _i1.EndpointConnector(
      name: 'afilnetWhatsApp',
      endpoint: endpoints['afilnetWhatsApp']!,
      methodConnectors: {
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'destination': _i1.ParameterDescription(
              name: 'destination',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['afilnetWhatsApp'] as _i4.AfilnetWhatsAppEndpoint)
                  .sendMessage(
            session,
            params['destination'],
            params['message'],
          ),
        )
      },
    );
    connectors['contact'] = _i1.EndpointConnector(
      name: 'contact',
      endpoint: endpoints['contact']!,
      methodConnectors: {
        'addContact': _i1.MethodConnector(
          name: 'addContact',
          params: {
            'contact': _i1.ParameterDescription(
              name: 'contact',
              type: _i1.getType<_i11.Contact>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).addContact(
            session,
            params['contact'],
          ),
        ),
        'addListOfContacts': _i1.MethodConnector(
          name: 'addListOfContacts',
          params: {
            'contacts': _i1.ParameterDescription(
              name: 'contacts',
              type: _i1.getType<List<_i11.Contact>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).addListOfContacts(
            session,
            params['contacts'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'contactID': _i1.ParameterDescription(
              name: 'contactID',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).findById(
            session,
            params['contactID'],
          ),
        ),
        'getEveryContactByUser': _i1.MethodConnector(
          name: 'getEveryContactByUser',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint)
                  .getEveryContactByUser(
            session,
            params['userID'],
          ),
        ),
        'isContactOnList': _i1.MethodConnector(
          name: 'isContactOnList',
          params: {
            'phoneNumber': _i1.ParameterDescription(
              name: 'phoneNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).isContactOnList(
            session,
            params['phoneNumber'],
            params['userID'],
          ),
        ),
        'updateContact': _i1.MethodConnector(
          name: 'updateContact',
          params: {
            'contact': _i1.ParameterDescription(
              name: 'contact',
              type: _i1.getType<_i11.Contact?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).updateContact(
            session,
            params['contact'],
          ),
        ),
        'deleteContact': _i1.MethodConnector(
          name: 'deleteContact',
          params: {
            'contact': _i1.ParameterDescription(
              name: 'contact',
              type: _i1.getType<_i11.Contact>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint).deleteContact(
            session,
            params['contact'],
          ),
        ),
        'deleteMultipleContacts': _i1.MethodConnector(
          name: 'deleteMultipleContacts',
          params: {
            'tasks': _i1.ParameterDescription(
              name: 'tasks',
              type: _i1.getType<List<_i11.Contact>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i5.ContactEndpoint)
                  .deleteMultipleContacts(
            session,
            params['tasks'],
          ),
        ),
      },
    );
    connectors['tasks'] = _i1.EndpointConnector(
      name: 'tasks',
      endpoint: endpoints['tasks']!,
      methodConnectors: {
        'addTask': _i1.MethodConnector(
          name: 'addTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).addTask(
            session,
            params['task'],
          ),
        ),
        'addListOfTasks': _i1.MethodConnector(
          name: 'addListOfTasks',
          params: {
            'tasks': _i1.ParameterDescription(
              name: 'tasks',
              type: _i1.getType<List<_i12.Task>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).addListOfTasks(
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
              (endpoints['tasks'] as _i6.TasksEndpoint).findById(
            session,
            params['taskID'],
          ),
        ),
        'getEveryTaskByUser': _i1.MethodConnector(
          name: 'getEveryTaskByUser',
          params: {
            'userID': _i1.ParameterDescription(
              name: 'userID',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).getEveryTaskByUser(
            session,
            params['userID'],
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
              (endpoints['tasks'] as _i6.TasksEndpoint)
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
              (endpoints['tasks'] as _i6.TasksEndpoint)
                  .getEveryTaskByDeadLineDES(session),
        ),
        'updateTask': _i1.MethodConnector(
          name: 'updateTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).updateTask(
            session,
            params['task'],
          ),
        ),
        'toogleComplete': _i1.MethodConnector(
          name: 'toogleComplete',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).toogleComplete(
            session,
            params['task'],
          ),
        ),
        'deleteTask': _i1.MethodConnector(
          name: 'deleteTask',
          params: {
            'task': _i1.ParameterDescription(
              name: 'task',
              type: _i1.getType<_i12.Task>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).deleteTask(
            session,
            params['task'],
          ),
        ),
        'deleteMultipleTasks': _i1.MethodConnector(
          name: 'deleteMultipleTasks',
          params: {
            'tasks': _i1.ParameterDescription(
              name: 'tasks',
              type: _i1.getType<List<_i12.Task>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tasks'] as _i6.TasksEndpoint).deleteMultipleTasks(
            session,
            params['tasks'],
          ),
        ),
      },
    );
    connectors['authenticated'] = _i1.EndpointConnector(
      name: 'authenticated',
      endpoint: endpoints['authenticated']!,
      methodConnectors: {
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authenticated'] as _i7.AuthenticatedEndpoint)
                  .logout(session),
        ),
        'getUserIfAuth': _i1.MethodConnector(
          name: 'getUserIfAuth',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authenticated'] as _i7.AuthenticatedEndpoint)
                  .getUserIfAuth(session),
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
              type: _i1.getType<_i13.PasswordOptions>(),
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
              (endpoints['passwordGenerator'] as _i8.PasswordGeneratorEndpoint)
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
              (endpoints['passwordOptions'] as _i9.PasswordOptionsEndpoint)
                  .getOptions(
            session,
            params['optionsID'],
          ),
        ),
        'getLastID': _i1.MethodConnector(
          name: 'getLastID',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i9.PasswordOptionsEndpoint)
                  .getLastID(session),
        ),
        'updateOptions': _i1.MethodConnector(
          name: 'updateOptions',
          params: {
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<_i13.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i9.PasswordOptionsEndpoint)
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
              type: _i1.getType<_i13.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i9.PasswordOptionsEndpoint)
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
              type: _i1.getType<_i13.PasswordOptions>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['passwordOptions'] as _i9.PasswordOptionsEndpoint)
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
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
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
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getUserById(
            session,
            params['userId'],
          ),
        ),
        'getUserInfoById': _i1.MethodConnector(
          name: 'getUserInfoById',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getUserInfoById(
            session,
            params['userInfoId'],
          ),
        ),
        'getUserByName': _i1.MethodConnector(
          name: 'getUserByName',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getUserByName(
            session,
            params['name'],
          ),
        ),
        'checkUserExistanceByName': _i1.MethodConnector(
          name: 'checkUserExistanceByName',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .checkUserExistanceByName(
            session,
            params['name'],
          ),
        ),
        'getLastUserID': _i1.MethodConnector(
          name: 'getLastUserID',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getLastUserID(session),
        ),
        'updateUser': _i1.MethodConnector(
          name: 'updateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i14.UsersRegistry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .updateUser(
            session,
            params['user'],
          ),
        ),
        'updateUserInfo': _i1.MethodConnector(
          name: 'updateUserInfo',
          params: {
            'userInfo': _i1.ParameterDescription(
              name: 'userInfo',
              type: _i1.getType<_i15.UserInfo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .updateUserInfo(
            session,
            params['userInfo'],
          ),
        ),
        'createUser': _i1.MethodConnector(
          name: 'createUser',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'selectedUserOptions': _i1.ParameterDescription(
              name: 'selectedUserOptions',
              type: _i1.getType<_i13.PasswordOptions>(),
              nullable: false,
            ),
            'selectedUserPassword': _i1.ParameterDescription(
              name: 'selectedUserPassword',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .createUser(
            session,
            params['name'],
            params['selectedUserOptions'],
            selectedUserPassword: params['selectedUserPassword'],
          ),
        ),
        'deleteUser': _i1.MethodConnector(
          name: 'deleteUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i14.UsersRegistry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .deleteUser(
            session,
            params['user'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint).login(
            session,
            params['username'],
            params['password'],
          ),
        ),
        'authenticateUser': _i1.MethodConnector(
          name: 'authenticateUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i14.UsersRegistry?>(),
              nullable: true,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .authenticateUser(
            session,
            params['user'],
            params['password'],
          ),
        ),
        'validatePassword': _i1.MethodConnector(
          name: 'validatePassword',
          params: {
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'hashedPass': _i1.ParameterDescription(
              name: 'hashedPass',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .validatePassword(
            session,
            params['password'],
            params['hashedPass'],
          ),
        ),
        'createUserInfo': _i1.MethodConnector(
          name: 'createUserInfo',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .createUserInfo(
            session,
            params['username'],
          ),
        ),
        'getUserRegistry': _i1.MethodConnector(
          name: 'getUserRegistry',
          params: {
            'userRegistry': _i1.ParameterDescription(
              name: 'userRegistry',
              type: _i1.getType<_i14.UsersRegistry>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getUserRegistry(
            session,
            params['userRegistry'],
          ),
        ),
        'getUserInfo': _i1.MethodConnector(
          name: 'getUserInfo',
          params: {
            'userInfo': _i1.ParameterDescription(
              name: 'userInfo',
              type: _i1.getType<_i15.UserInfo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usersRegistry'] as _i10.UsersRegistryEndpoint)
                  .getUserInfo(
            session,
            params['userInfo'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
  }
}
