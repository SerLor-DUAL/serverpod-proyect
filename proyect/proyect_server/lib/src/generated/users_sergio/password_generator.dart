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

abstract class PasswordGenerator extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PasswordGenerator._({
    int? id,
    required this.optionsId,
    this.options,
    required this.password,
  }) : super(id);

  factory PasswordGenerator({
    int? id,
    required int optionsId,
    _i2.PasswordOptions? options,
    required String password,
  }) = _PasswordGeneratorImpl;

  factory PasswordGenerator.fromJson(Map<String, dynamic> jsonSerialization) {
    return PasswordGenerator(
      id: jsonSerialization['id'] as int?,
      optionsId: jsonSerialization['optionsId'] as int,
      options: jsonSerialization['options'] == null
          ? null
          : _i2.PasswordOptions.fromJson(
              (jsonSerialization['options'] as Map<String, dynamic>)),
      password: jsonSerialization['password'] as String,
    );
  }

  static final t = PasswordGeneratorTable();

  static const db = PasswordGeneratorRepository._();

  int optionsId;

  _i2.PasswordOptions? options;

  String password;

  @override
  _i1.Table get table => t;

  PasswordGenerator copyWith({
    int? id,
    int? optionsId,
    _i2.PasswordOptions? options,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'optionsId': optionsId,
      if (options != null) 'options': options?.toJson(),
      'password': password,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'optionsId': optionsId,
      if (options != null) 'options': options?.toJsonForProtocol(),
      'password': password,
    };
  }

  static PasswordGeneratorInclude include(
      {_i2.PasswordOptionsInclude? options}) {
    return PasswordGeneratorInclude._(options: options);
  }

  static PasswordGeneratorIncludeList includeList({
    _i1.WhereExpressionBuilder<PasswordGeneratorTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PasswordGeneratorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordGeneratorTable>? orderByList,
    PasswordGeneratorInclude? include,
  }) {
    return PasswordGeneratorIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PasswordGenerator.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PasswordGenerator.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PasswordGeneratorImpl extends PasswordGenerator {
  _PasswordGeneratorImpl({
    int? id,
    required int optionsId,
    _i2.PasswordOptions? options,
    required String password,
  }) : super._(
          id: id,
          optionsId: optionsId,
          options: options,
          password: password,
        );

  @override
  PasswordGenerator copyWith({
    Object? id = _Undefined,
    int? optionsId,
    Object? options = _Undefined,
    String? password,
  }) {
    return PasswordGenerator(
      id: id is int? ? id : this.id,
      optionsId: optionsId ?? this.optionsId,
      options:
          options is _i2.PasswordOptions? ? options : this.options?.copyWith(),
      password: password ?? this.password,
    );
  }
}

class PasswordGeneratorTable extends _i1.Table {
  PasswordGeneratorTable({super.tableRelation})
      : super(tableName: 'password_generator') {
    optionsId = _i1.ColumnInt(
      'optionsId',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
  }

  late final _i1.ColumnInt optionsId;

  _i2.PasswordOptionsTable? _options;

  late final _i1.ColumnString password;

  _i2.PasswordOptionsTable get options {
    if (_options != null) return _options!;
    _options = _i1.createRelationTable(
      relationFieldName: 'options',
      field: PasswordGenerator.t.optionsId,
      foreignField: _i2.PasswordOptions.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PasswordOptionsTable(tableRelation: foreignTableRelation),
    );
    return _options!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        optionsId,
        password,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'options') {
      return options;
    }
    return null;
  }
}

class PasswordGeneratorInclude extends _i1.IncludeObject {
  PasswordGeneratorInclude._({_i2.PasswordOptionsInclude? options}) {
    _options = options;
  }

  _i2.PasswordOptionsInclude? _options;

  @override
  Map<String, _i1.Include?> get includes => {'options': _options};

  @override
  _i1.Table get table => PasswordGenerator.t;
}

class PasswordGeneratorIncludeList extends _i1.IncludeList {
  PasswordGeneratorIncludeList._({
    _i1.WhereExpressionBuilder<PasswordGeneratorTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PasswordGenerator.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PasswordGenerator.t;
}

class PasswordGeneratorRepository {
  const PasswordGeneratorRepository._();

  final attachRow = const PasswordGeneratorAttachRowRepository._();

  Future<List<PasswordGenerator>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordGeneratorTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PasswordGeneratorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordGeneratorTable>? orderByList,
    _i1.Transaction? transaction,
    PasswordGeneratorInclude? include,
  }) async {
    return session.db.find<PasswordGenerator>(
      where: where?.call(PasswordGenerator.t),
      orderBy: orderBy?.call(PasswordGenerator.t),
      orderByList: orderByList?.call(PasswordGenerator.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PasswordGenerator?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordGeneratorTable>? where,
    int? offset,
    _i1.OrderByBuilder<PasswordGeneratorTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordGeneratorTable>? orderByList,
    _i1.Transaction? transaction,
    PasswordGeneratorInclude? include,
  }) async {
    return session.db.findFirstRow<PasswordGenerator>(
      where: where?.call(PasswordGenerator.t),
      orderBy: orderBy?.call(PasswordGenerator.t),
      orderByList: orderByList?.call(PasswordGenerator.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<PasswordGenerator?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PasswordGeneratorInclude? include,
  }) async {
    return session.db.findById<PasswordGenerator>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<PasswordGenerator>> insert(
    _i1.Session session,
    List<PasswordGenerator> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PasswordGenerator>(
      rows,
      transaction: transaction,
    );
  }

  Future<PasswordGenerator> insertRow(
    _i1.Session session,
    PasswordGenerator row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PasswordGenerator>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PasswordGenerator>> update(
    _i1.Session session,
    List<PasswordGenerator> rows, {
    _i1.ColumnSelections<PasswordGeneratorTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PasswordGenerator>(
      rows,
      columns: columns?.call(PasswordGenerator.t),
      transaction: transaction,
    );
  }

  Future<PasswordGenerator> updateRow(
    _i1.Session session,
    PasswordGenerator row, {
    _i1.ColumnSelections<PasswordGeneratorTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PasswordGenerator>(
      row,
      columns: columns?.call(PasswordGenerator.t),
      transaction: transaction,
    );
  }

  Future<List<PasswordGenerator>> delete(
    _i1.Session session,
    List<PasswordGenerator> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PasswordGenerator>(
      rows,
      transaction: transaction,
    );
  }

  Future<PasswordGenerator> deleteRow(
    _i1.Session session,
    PasswordGenerator row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PasswordGenerator>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PasswordGenerator>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PasswordGeneratorTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PasswordGenerator>(
      where: where(PasswordGenerator.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordGeneratorTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PasswordGenerator>(
      where: where?.call(PasswordGenerator.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PasswordGeneratorAttachRowRepository {
  const PasswordGeneratorAttachRowRepository._();

  Future<void> options(
    _i1.Session session,
    PasswordGenerator passwordGenerator,
    _i2.PasswordOptions options,
  ) async {
    if (passwordGenerator.id == null) {
      throw ArgumentError.notNull('passwordGenerator.id');
    }
    if (options.id == null) {
      throw ArgumentError.notNull('options.id');
    }

    var $passwordGenerator = passwordGenerator.copyWith(optionsId: options.id);
    await session.db.updateRow<PasswordGenerator>(
      $passwordGenerator,
      columns: [PasswordGenerator.t.optionsId],
    );
  }
}
