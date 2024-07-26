/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Contact extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Contact._({
    int? id,
    required this.name,
    required this.phoneNumber,
    this.profileIMG,
    required this.userID,
  }) : super(id);

  factory Contact({
    int? id,
    required String name,
    required String phoneNumber,
    String? profileIMG,
    required int userID,
  }) = _ContactImpl;

  factory Contact.fromJson(Map<String, dynamic> jsonSerialization) {
    return Contact(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      profileIMG: jsonSerialization['profileIMG'] as String?,
      userID: jsonSerialization['userID'] as int,
    );
  }

  static final t = ContactTable();

  static const db = ContactRepository._();

  String name;

  String phoneNumber;

  String? profileIMG;

  int userID;

  @override
  _i1.Table get table => t;

  Contact copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? profileIMG,
    int? userID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      if (profileIMG != null) 'profileIMG': profileIMG,
      'userID': userID,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      if (profileIMG != null) 'profileIMG': profileIMG,
      'userID': userID,
    };
  }

  static ContactInclude include() {
    return ContactInclude._();
  }

  static ContactIncludeList includeList({
    _i1.WhereExpressionBuilder<ContactTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactTable>? orderByList,
    ContactInclude? include,
  }) {
    return ContactIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Contact.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Contact.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ContactImpl extends Contact {
  _ContactImpl({
    int? id,
    required String name,
    required String phoneNumber,
    String? profileIMG,
    required int userID,
  }) : super._(
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          profileIMG: profileIMG,
          userID: userID,
        );

  @override
  Contact copyWith({
    Object? id = _Undefined,
    String? name,
    String? phoneNumber,
    Object? profileIMG = _Undefined,
    int? userID,
  }) {
    return Contact(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileIMG: profileIMG is String? ? profileIMG : this.profileIMG,
      userID: userID ?? this.userID,
    );
  }
}

class ContactTable extends _i1.Table {
  ContactTable({super.tableRelation}) : super(tableName: 'contacts') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    profileIMG = _i1.ColumnString(
      'profileIMG',
      this,
    );
    userID = _i1.ColumnInt(
      'userID',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString profileIMG;

  late final _i1.ColumnInt userID;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        phoneNumber,
        profileIMG,
        userID,
      ];
}

class ContactInclude extends _i1.IncludeObject {
  ContactInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Contact.t;
}

class ContactIncludeList extends _i1.IncludeList {
  ContactIncludeList._({
    _i1.WhereExpressionBuilder<ContactTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Contact.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Contact.t;
}

class ContactRepository {
  const ContactRepository._();

  Future<List<Contact>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Contact>(
      where: where?.call(Contact.t),
      orderBy: orderBy?.call(Contact.t),
      orderByList: orderByList?.call(Contact.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Contact?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactTable>? where,
    int? offset,
    _i1.OrderByBuilder<ContactTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ContactTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Contact>(
      where: where?.call(Contact.t),
      orderBy: orderBy?.call(Contact.t),
      orderByList: orderByList?.call(Contact.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Contact?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Contact>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Contact>> insert(
    _i1.Session session,
    List<Contact> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Contact>(
      rows,
      transaction: transaction,
    );
  }

  Future<Contact> insertRow(
    _i1.Session session,
    Contact row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Contact>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Contact>> update(
    _i1.Session session,
    List<Contact> rows, {
    _i1.ColumnSelections<ContactTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Contact>(
      rows,
      columns: columns?.call(Contact.t),
      transaction: transaction,
    );
  }

  Future<Contact> updateRow(
    _i1.Session session,
    Contact row, {
    _i1.ColumnSelections<ContactTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Contact>(
      row,
      columns: columns?.call(Contact.t),
      transaction: transaction,
    );
  }

  Future<List<Contact>> delete(
    _i1.Session session,
    List<Contact> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Contact>(
      rows,
      transaction: transaction,
    );
  }

  Future<Contact> deleteRow(
    _i1.Session session,
    Contact row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Contact>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Contact>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ContactTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Contact>(
      where: where(Contact.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ContactTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Contact>(
      where: where?.call(Contact.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
