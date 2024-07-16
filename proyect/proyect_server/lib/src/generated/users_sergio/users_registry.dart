/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class UsersRegistry extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UsersRegistry._({
    int? id,
    required this.userName,
    required this.userPasswordId,
    this.userPassword,
  }) : super(id);

  factory UsersRegistry({
    int? id,
    required String userName,
    required int userPasswordId,
    _i2.PasswordGenerator? userPassword,
  }) = _UsersRegistryImpl;

  factory UsersRegistry.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsersRegistry(
      id: jsonSerialization['id'] as int?,
      userName: jsonSerialization['userName'] as String,
      userPasswordId: jsonSerialization['userPasswordId'] as int,
      userPassword: jsonSerialization['userPassword'] == null
          ? null
          : _i2.PasswordGenerator.fromJson(
              (jsonSerialization['userPassword'] as Map<String, dynamic>)),
    );
  }

  static final t = UsersRegistryTable();

  static const db = UsersRegistryRepository._();

  String userName;

  int userPasswordId;

  _i2.PasswordGenerator? userPassword;

  @override
  _i1.Table get table => t;

  UsersRegistry copyWith({
    int? id,
    String? userName,
    int? userPasswordId,
    _i2.PasswordGenerator? userPassword,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userName': userName,
      'userPasswordId': userPasswordId,
      if (userPassword != null) 'userPassword': userPassword?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userName': userName,
      'userPasswordId': userPasswordId,
      if (userPassword != null)
        'userPassword': userPassword?.toJsonForProtocol(),
    };
  }

  static UsersRegistryInclude include(
      {_i2.PasswordGeneratorInclude? userPassword}) {
    return UsersRegistryInclude._(userPassword: userPassword);
  }

  static UsersRegistryIncludeList includeList({
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsersRegistryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersRegistryTable>? orderByList,
    UsersRegistryInclude? include,
  }) {
    return UsersRegistryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UsersRegistry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UsersRegistry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsersRegistryImpl extends UsersRegistry {
  _UsersRegistryImpl({
    int? id,
    required String userName,
    required int userPasswordId,
    _i2.PasswordGenerator? userPassword,
  }) : super._(
          id: id,
          userName: userName,
          userPasswordId: userPasswordId,
          userPassword: userPassword,
        );

  @override
  UsersRegistry copyWith({
    Object? id = _Undefined,
    String? userName,
    int? userPasswordId,
    Object? userPassword = _Undefined,
  }) {
    return UsersRegistry(
      id: id is int? ? id : this.id,
      userName: userName ?? this.userName,
      userPasswordId: userPasswordId ?? this.userPasswordId,
      userPassword: userPassword is _i2.PasswordGenerator?
          ? userPassword
          : this.userPassword?.copyWith(),
    );
  }
}

class UsersRegistryTable extends _i1.Table {
  UsersRegistryTable({super.tableRelation})
      : super(tableName: 'users_registry') {
    userName = _i1.ColumnString(
      'userName',
      this,
    );
    userPasswordId = _i1.ColumnInt(
      'userPasswordId',
      this,
    );
  }

  late final _i1.ColumnString userName;

  late final _i1.ColumnInt userPasswordId;

  _i2.PasswordGeneratorTable? _userPassword;

  _i2.PasswordGeneratorTable get userPassword {
    if (_userPassword != null) return _userPassword!;
    _userPassword = _i1.createRelationTable(
      relationFieldName: 'userPassword',
      field: UsersRegistry.t.userPasswordId,
      foreignField: _i2.PasswordGenerator.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PasswordGeneratorTable(tableRelation: foreignTableRelation),
    );
    return _userPassword!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userName,
        userPasswordId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userPassword') {
      return userPassword;
    }
    return null;
  }
}

class UsersRegistryInclude extends _i1.IncludeObject {
  UsersRegistryInclude._({_i2.PasswordGeneratorInclude? userPassword}) {
    _userPassword = userPassword;
  }

  _i2.PasswordGeneratorInclude? _userPassword;

  @override
  Map<String, _i1.Include?> get includes => {'userPassword': _userPassword};

  @override
  _i1.Table get table => UsersRegistry.t;
}

class UsersRegistryIncludeList extends _i1.IncludeList {
  UsersRegistryIncludeList._({
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UsersRegistry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UsersRegistry.t;
}

class UsersRegistryRepository {
  const UsersRegistryRepository._();

  final attachRow = const UsersRegistryAttachRowRepository._();

  Future<List<UsersRegistry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsersRegistryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersRegistryTable>? orderByList,
    _i1.Transaction? transaction,
    UsersRegistryInclude? include,
  }) async {
    return session.db.find<UsersRegistry>(
      where: where?.call(UsersRegistry.t),
      orderBy: orderBy?.call(UsersRegistry.t),
      orderByList: orderByList?.call(UsersRegistry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UsersRegistry?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    int? offset,
    _i1.OrderByBuilder<UsersRegistryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersRegistryTable>? orderByList,
    _i1.Transaction? transaction,
    UsersRegistryInclude? include,
  }) async {
    return session.db.findFirstRow<UsersRegistry>(
      where: where?.call(UsersRegistry.t),
      orderBy: orderBy?.call(UsersRegistry.t),
      orderByList: orderByList?.call(UsersRegistry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<UsersRegistry?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UsersRegistryInclude? include,
  }) async {
    return session.db.findById<UsersRegistry>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<UsersRegistry>> insert(
    _i1.Session session,
    List<UsersRegistry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UsersRegistry>(
      rows,
      transaction: transaction,
    );
  }

  Future<UsersRegistry> insertRow(
    _i1.Session session,
    UsersRegistry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UsersRegistry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UsersRegistry>> update(
    _i1.Session session,
    List<UsersRegistry> rows, {
    _i1.ColumnSelections<UsersRegistryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UsersRegistry>(
      rows,
      columns: columns?.call(UsersRegistry.t),
      transaction: transaction,
    );
  }

  Future<UsersRegistry> updateRow(
    _i1.Session session,
    UsersRegistry row, {
    _i1.ColumnSelections<UsersRegistryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UsersRegistry>(
      row,
      columns: columns?.call(UsersRegistry.t),
      transaction: transaction,
    );
  }

  Future<List<UsersRegistry>> delete(
    _i1.Session session,
    List<UsersRegistry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UsersRegistry>(
      rows,
      transaction: transaction,
    );
  }

  Future<UsersRegistry> deleteRow(
    _i1.Session session,
    UsersRegistry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UsersRegistry>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UsersRegistry>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UsersRegistryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UsersRegistry>(
      where: where(UsersRegistry.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UsersRegistry>(
      where: where?.call(UsersRegistry.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UsersRegistryAttachRowRepository {
  const UsersRegistryAttachRowRepository._();

  Future<void> userPassword(
    _i1.Session session,
    UsersRegistry usersRegistry,
    _i2.PasswordGenerator userPassword,
  ) async {
    if (usersRegistry.id == null) {
      throw ArgumentError.notNull('usersRegistry.id');
    }
    if (userPassword.id == null) {
      throw ArgumentError.notNull('userPassword.id');
    }

    var $usersRegistry =
        usersRegistry.copyWith(userPasswordId: userPassword.id);
    await session.db.updateRow<UsersRegistry>(
      $usersRegistry,
      columns: [UsersRegistry.t.userPasswordId],
    );
  }
}
