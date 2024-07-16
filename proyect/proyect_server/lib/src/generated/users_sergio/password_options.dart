/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class PasswordOptions extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  PasswordOptions._({
    int? id,
    required this.passwordLengthOption,
    required this.upperOption,
    required this.numberOption,
    required this.specialOption,
    required this.automatedPassword,
  }) : super(id);

  factory PasswordOptions({
    int? id,
    required int passwordLengthOption,
    required bool upperOption,
    required bool numberOption,
    required bool specialOption,
    required bool automatedPassword,
  }) = _PasswordOptionsImpl;

  factory PasswordOptions.fromJson(Map<String, dynamic> jsonSerialization) {
    return PasswordOptions(
      id: jsonSerialization['id'] as int?,
      passwordLengthOption: jsonSerialization['passwordLengthOption'] as int,
      upperOption: jsonSerialization['upperOption'] as bool,
      numberOption: jsonSerialization['numberOption'] as bool,
      specialOption: jsonSerialization['specialOption'] as bool,
      automatedPassword: jsonSerialization['automatedPassword'] as bool,
    );
  }

  static final t = PasswordOptionsTable();

  static const db = PasswordOptionsRepository._();

  int passwordLengthOption;

  bool upperOption;

  bool numberOption;

  bool specialOption;

  bool automatedPassword;

  @override
  _i1.Table get table => t;

  PasswordOptions copyWith({
    int? id,
    int? passwordLengthOption,
    bool? upperOption,
    bool? numberOption,
    bool? specialOption,
    bool? automatedPassword,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'passwordLengthOption': passwordLengthOption,
      'upperOption': upperOption,
      'numberOption': numberOption,
      'specialOption': specialOption,
      'automatedPassword': automatedPassword,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'passwordLengthOption': passwordLengthOption,
      'upperOption': upperOption,
      'numberOption': numberOption,
      'specialOption': specialOption,
      'automatedPassword': automatedPassword,
    };
  }

  static PasswordOptionsInclude include() {
    return PasswordOptionsInclude._();
  }

  static PasswordOptionsIncludeList includeList({
    _i1.WhereExpressionBuilder<PasswordOptionsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PasswordOptionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordOptionsTable>? orderByList,
    PasswordOptionsInclude? include,
  }) {
    return PasswordOptionsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PasswordOptions.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PasswordOptions.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PasswordOptionsImpl extends PasswordOptions {
  _PasswordOptionsImpl({
    int? id,
    required int passwordLengthOption,
    required bool upperOption,
    required bool numberOption,
    required bool specialOption,
    required bool automatedPassword,
  }) : super._(
          id: id,
          passwordLengthOption: passwordLengthOption,
          upperOption: upperOption,
          numberOption: numberOption,
          specialOption: specialOption,
          automatedPassword: automatedPassword,
        );

  @override
  PasswordOptions copyWith({
    Object? id = _Undefined,
    int? passwordLengthOption,
    bool? upperOption,
    bool? numberOption,
    bool? specialOption,
    bool? automatedPassword,
  }) {
    return PasswordOptions(
      id: id is int? ? id : this.id,
      passwordLengthOption: passwordLengthOption ?? this.passwordLengthOption,
      upperOption: upperOption ?? this.upperOption,
      numberOption: numberOption ?? this.numberOption,
      specialOption: specialOption ?? this.specialOption,
      automatedPassword: automatedPassword ?? this.automatedPassword,
    );
  }
}

class PasswordOptionsTable extends _i1.Table {
  PasswordOptionsTable({super.tableRelation})
      : super(tableName: 'password_options') {
    passwordLengthOption = _i1.ColumnInt(
      'passwordLengthOption',
      this,
    );
    upperOption = _i1.ColumnBool(
      'upperOption',
      this,
    );
    numberOption = _i1.ColumnBool(
      'numberOption',
      this,
    );
    specialOption = _i1.ColumnBool(
      'specialOption',
      this,
    );
    automatedPassword = _i1.ColumnBool(
      'automatedPassword',
      this,
    );
  }

  late final _i1.ColumnInt passwordLengthOption;

  late final _i1.ColumnBool upperOption;

  late final _i1.ColumnBool numberOption;

  late final _i1.ColumnBool specialOption;

  late final _i1.ColumnBool automatedPassword;

  @override
  List<_i1.Column> get columns => [
        id,
        passwordLengthOption,
        upperOption,
        numberOption,
        specialOption,
        automatedPassword,
      ];
}

class PasswordOptionsInclude extends _i1.IncludeObject {
  PasswordOptionsInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => PasswordOptions.t;
}

class PasswordOptionsIncludeList extends _i1.IncludeList {
  PasswordOptionsIncludeList._({
    _i1.WhereExpressionBuilder<PasswordOptionsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PasswordOptions.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => PasswordOptions.t;
}

class PasswordOptionsRepository {
  const PasswordOptionsRepository._();

  Future<List<PasswordOptions>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordOptionsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PasswordOptionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordOptionsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PasswordOptions>(
      where: where?.call(PasswordOptions.t),
      orderBy: orderBy?.call(PasswordOptions.t),
      orderByList: orderByList?.call(PasswordOptions.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PasswordOptions?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordOptionsTable>? where,
    int? offset,
    _i1.OrderByBuilder<PasswordOptionsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PasswordOptionsTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<PasswordOptions>(
      where: where?.call(PasswordOptions.t),
      orderBy: orderBy?.call(PasswordOptions.t),
      orderByList: orderByList?.call(PasswordOptions.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<PasswordOptions?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<PasswordOptions>(
      id,
      transaction: transaction,
    );
  }

  Future<List<PasswordOptions>> insert(
    _i1.Session session,
    List<PasswordOptions> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PasswordOptions>(
      rows,
      transaction: transaction,
    );
  }

  Future<PasswordOptions> insertRow(
    _i1.Session session,
    PasswordOptions row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PasswordOptions>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PasswordOptions>> update(
    _i1.Session session,
    List<PasswordOptions> rows, {
    _i1.ColumnSelections<PasswordOptionsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PasswordOptions>(
      rows,
      columns: columns?.call(PasswordOptions.t),
      transaction: transaction,
    );
  }

  Future<PasswordOptions> updateRow(
    _i1.Session session,
    PasswordOptions row, {
    _i1.ColumnSelections<PasswordOptionsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PasswordOptions>(
      row,
      columns: columns?.call(PasswordOptions.t),
      transaction: transaction,
    );
  }

  Future<List<PasswordOptions>> delete(
    _i1.Session session,
    List<PasswordOptions> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PasswordOptions>(
      rows,
      transaction: transaction,
    );
  }

  Future<PasswordOptions> deleteRow(
    _i1.Session session,
    PasswordOptions row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PasswordOptions>(
      row,
      transaction: transaction,
    );
  }

  Future<List<PasswordOptions>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PasswordOptionsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PasswordOptions>(
      where: where(PasswordOptions.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PasswordOptionsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PasswordOptions>(
      where: where?.call(PasswordOptions.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
