/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class UsersRegistry extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UsersRegistry._({
    int? id,
    required this.userName,
    required this.userPassword,
    required this.options,
  }) : super(id);

  factory UsersRegistry({
    int? id,
    required String userName,
    required String userPassword,
    required int options,
  }) = _UsersRegistryImpl;

  factory UsersRegistry.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsersRegistry(
      id: jsonSerialization['id'] as int?,
      userName: jsonSerialization['userName'] as String,
      userPassword: jsonSerialization['userPassword'] as String,
      options: jsonSerialization['options'] as int,
    );
  }

  static final t = UsersRegistryTable();

  static const db = UsersRegistryRepository._();

  String userName;

  String userPassword;

  int options;

  @override
  _i1.Table get table => t;

  UsersRegistry copyWith({
    int? id,
    String? userName,
    String? userPassword,
    int? options,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userName': userName,
      'userPassword': userPassword,
      'options': options,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userName': userName,
      'userPassword': userPassword,
      'options': options,
    };
  }

  static UsersRegistryInclude include() {
    return UsersRegistryInclude._();
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
    required String userPassword,
    required int options,
  }) : super._(
          id: id,
          userName: userName,
          userPassword: userPassword,
          options: options,
        );

  @override
  UsersRegistry copyWith({
    Object? id = _Undefined,
    String? userName,
    String? userPassword,
    int? options,
  }) {
    return UsersRegistry(
      id: id is int? ? id : this.id,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      options: options ?? this.options,
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
    userPassword = _i1.ColumnString(
      'userPassword',
      this,
    );
    options = _i1.ColumnInt(
      'options',
      this,
    );
  }

  late final _i1.ColumnString userName;

  late final _i1.ColumnString userPassword;

  late final _i1.ColumnInt options;

  @override
  List<_i1.Column> get columns => [
        id,
        userName,
        userPassword,
        options,
      ];
}

class UsersRegistryInclude extends _i1.IncludeObject {
  UsersRegistryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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

  Future<List<UsersRegistry>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersRegistryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsersRegistryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersRegistryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UsersRegistry>(
      where: where?.call(UsersRegistry.t),
      orderBy: orderBy?.call(UsersRegistry.t),
      orderByList: orderByList?.call(UsersRegistry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
  }) async {
    return session.db.findFirstRow<UsersRegistry>(
      where: where?.call(UsersRegistry.t),
      orderBy: orderBy?.call(UsersRegistry.t),
      orderByList: orderByList?.call(UsersRegistry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UsersRegistry?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UsersRegistry>(
      id,
      transaction: transaction,
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
