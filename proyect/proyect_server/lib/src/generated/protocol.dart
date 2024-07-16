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
import 'todo_list_santi/tasks.dart' as _i3;
import 'users_sergio/password_generator.dart' as _i4;
import 'users_sergio/password_options.dart' as _i5;
import 'users_sergio/users_registry.dart' as _i6;
import 'package:proyect_server/src/generated/todo_list_santi/tasks.dart' as _i7;
import 'package:proyect_server/src/generated/users_sergio/users_registry.dart'
    as _i8;
export 'todo_list_santi/tasks.dart';
export 'users_sergio/password_generator.dart';
export 'users_sergio/password_options.dart';
export 'users_sergio/users_registry.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'password_generator',
      dartName: 'PasswordGenerator',
      schema: 'public',
      module: 'proyect',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'password_generator_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'optionsId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'password_generator_fk_0',
          columns: ['optionsId'],
          referenceTable: 'password_options',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'password_generator_pkey',
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
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'upperOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'numberOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'specialOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
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
          isNullable: false,
          dartType: 'DateTime',
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
          isUnique: true,
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
          name: 'userPasswordId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'users_registry_fk_0',
          columns: ['userPasswordId'],
          referenceTable: 'password_generator',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
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
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Task) {
      return _i3.Task.fromJson(data) as T;
    }
    if (t == _i4.PasswordGenerator) {
      return _i4.PasswordGenerator.fromJson(data) as T;
    }
    if (t == _i5.PasswordOptions) {
      return _i5.PasswordOptions.fromJson(data) as T;
    }
    if (t == _i6.UsersRegistry) {
      return _i6.UsersRegistry.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Task?>()) {
      return (data != null ? _i3.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PasswordGenerator?>()) {
      return (data != null ? _i4.PasswordGenerator.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PasswordOptions?>()) {
      return (data != null ? _i5.PasswordOptions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.UsersRegistry?>()) {
      return (data != null ? _i6.UsersRegistry.fromJson(data) : null) as T;
    }
    if (t == List<_i7.Task>) {
      return (data as List).map((e) => deserialize<_i7.Task>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.UsersRegistry>) {
      return (data as List)
          .map((e) => deserialize<_i8.UsersRegistry>(e))
          .toList() as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Task) {
      return 'Task';
    }
    if (data is _i4.PasswordGenerator) {
      return 'PasswordGenerator';
    }
    if (data is _i5.PasswordOptions) {
      return 'PasswordOptions';
    }
    if (data is _i6.UsersRegistry) {
      return 'UsersRegistry';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Task') {
      return deserialize<_i3.Task>(data['data']);
    }
    if (data['className'] == 'PasswordGenerator') {
      return deserialize<_i4.PasswordGenerator>(data['data']);
    }
    if (data['className'] == 'PasswordOptions') {
      return deserialize<_i5.PasswordOptions>(data['data']);
    }
    if (data['className'] == 'UsersRegistry') {
      return deserialize<_i6.UsersRegistry>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Task:
        return _i3.Task.t;
      case _i4.PasswordGenerator:
        return _i4.PasswordGenerator.t;
      case _i5.PasswordOptions:
        return _i5.PasswordOptions.t;
      case _i6.UsersRegistry:
        return _i6.UsersRegistry.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'proyect';
}
