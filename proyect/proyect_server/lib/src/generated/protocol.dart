/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'afilnet/afilnet_whatsapp_sergio_response.dart' as _i4;
import 'contacts/contacts.dart' as _i5;
import 'todolist/tasks.dart' as _i6;
import 'users/password_options.dart' as _i7;
import 'users/users_registry.dart' as _i8;
import 'package:proyect_server/src/generated/contacts/contacts.dart' as _i9;
import 'package:proyect_server/src/generated/todolist/tasks.dart' as _i10;
import 'package:proyect_server/src/generated/users/users_registry.dart' as _i11;
import 'package:proyect_shared_sergio/proyect_shared_sergio.dart' as _i12;
import 'package:proyect_shared_santiago/proyect_shared_santiago.dart' as _i13;
export 'afilnet/afilnet_whatsapp_sergio_response.dart';
export 'contacts/contacts.dart';
export 'todolist/tasks.dart';
export 'users/password_options.dart';
export 'users/users_registry.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'contacts',
      dartName: 'Contact',
      schema: 'public',
      module: 'proyect',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'contacts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'profileIMG',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'contacts_fk_0',
          columns: ['userID'],
          referenceTable: 'users_registry',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'contacts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'primary',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userID',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phoneNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'password_options',
      dartName: 'PasswordOptions',
      schema: 'public',
      module: 'proyect',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'password_options_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'passwordLengthOption',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'upperOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'numberOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'specialOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'automatedPassword',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'password_options_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tasks',
      dartName: 'Task',
      schema: 'public',
      module: 'proyect',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tasks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'deadLine',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'complete',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'userID',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tasks_fk_0',
          columns: ['userID'],
          referenceTable: 'users_registry',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tasks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userID',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'title_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'title',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users_registry',
      dartName: 'UsersRegistry',
      schema: 'public',
      module: 'proyect',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'users_registry_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userPassword',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'options',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'users_registry_fk_0',
          columns: ['options'],
          referenceTable: 'password_options',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'users_registry_fk_1',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_registry_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userName',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.AfilnetWhatsAppSergioResponse) {
      return _i4.AfilnetWhatsAppSergioResponse.fromJson(data) as T;
    }
    if (t == _i5.Contact) {
      return _i5.Contact.fromJson(data) as T;
    }
    if (t == _i6.Task) {
      return _i6.Task.fromJson(data) as T;
    }
    if (t == _i7.PasswordOptions) {
      return _i7.PasswordOptions.fromJson(data) as T;
    }
    if (t == _i8.UsersRegistry) {
      return _i8.UsersRegistry.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.AfilnetWhatsAppSergioResponse?>()) {
      return (data != null
          ? _i4.AfilnetWhatsAppSergioResponse.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i5.Contact?>()) {
      return (data != null ? _i5.Contact.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Task?>()) {
      return (data != null ? _i6.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.PasswordOptions?>()) {
      return (data != null ? _i7.PasswordOptions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.UsersRegistry?>()) {
      return (data != null ? _i8.UsersRegistry.fromJson(data) : null) as T;
    }
    if (t == List<_i9.Contact>) {
      return (data as List).map((e) => deserialize<_i9.Contact>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Task>) {
      return (data as List).map((e) => deserialize<_i10.Task>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.UsersRegistry>) {
      return (data as List)
          .map((e) => deserialize<_i11.UsersRegistry>(e))
          .toList() as dynamic;
    }
    if (t == _i12.GenericApiRequest) {
      return _i12.GenericApiRequest.fromJson(data) as T;
    }
    if (t == _i12.GenericApiResponse) {
      return _i12.GenericApiResponse.fromJson(data) as T;
    }
    if (t == _i13.MessageResponse) {
      return _i13.MessageResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i12.GenericApiRequest?>()) {
      return (data != null ? _i12.GenericApiRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.GenericApiResponse?>()) {
      return (data != null ? _i12.GenericApiResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.MessageResponse?>()) {
      return (data != null ? _i13.MessageResponse.fromJson(data) : null) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i12.GenericApiRequest) {
      return 'GenericApiRequest';
    }
    if (data is _i12.GenericApiResponse) {
      return 'GenericApiResponse';
    }
    if (data is _i13.MessageResponse) {
      return 'MessageResponse';
    }
    if (data is _i4.AfilnetWhatsAppSergioResponse) {
      return 'AfilnetWhatsAppSergioResponse';
    }
    if (data is _i5.Contact) {
      return 'Contact';
    }
    if (data is _i6.Task) {
      return 'Task';
    }
    if (data is _i7.PasswordOptions) {
      return 'PasswordOptions';
    }
    if (data is _i8.UsersRegistry) {
      return 'UsersRegistry';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'GenericApiRequest') {
      return deserialize<_i12.GenericApiRequest>(data['data']);
    }
    if (data['className'] == 'GenericApiResponse') {
      return deserialize<_i12.GenericApiResponse>(data['data']);
    }
    if (data['className'] == 'MessageResponse') {
      return deserialize<_i13.MessageResponse>(data['data']);
    }
    if (data['className'] == 'AfilnetWhatsAppSergioResponse') {
      return deserialize<_i4.AfilnetWhatsAppSergioResponse>(data['data']);
    }
    if (data['className'] == 'Contact') {
      return deserialize<_i5.Contact>(data['data']);
    }
    if (data['className'] == 'Task') {
      return deserialize<_i6.Task>(data['data']);
    }
    if (data['className'] == 'PasswordOptions') {
      return deserialize<_i7.PasswordOptions>(data['data']);
    }
    if (data['className'] == 'UsersRegistry') {
      return deserialize<_i8.UsersRegistry>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Contact:
        return _i5.Contact.t;
      case _i6.Task:
        return _i6.Task.t;
      case _i7.PasswordOptions:
        return _i7.PasswordOptions.t;
      case _i8.UsersRegistry:
        return _i8.UsersRegistry.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'proyect';
}
