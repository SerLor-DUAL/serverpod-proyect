/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Task implements _i1.SerializableModel {
  Task._({
    this.id,
    required this.title,
    this.description,
    required this.deadLine,
    required this.complete,
    required this.userID,
  });

  factory Task({
    int? id,
    required String title,
    String? description,
    required DateTime deadLine,
    required bool complete,
    required int userID,
  }) = _TaskImpl;

  factory Task.fromJson(Map<String, dynamic> jsonSerialization) {
    return Task(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      deadLine:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadLine']),
      complete: jsonSerialization['complete'] as bool,
      userID: jsonSerialization['userID'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? description;

  DateTime deadLine;

  bool complete;

  int userID;

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? deadLine,
    bool? complete,
    int? userID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      'deadLine': deadLine.toJson(),
      'complete': complete,
      'userID': userID,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskImpl extends Task {
  _TaskImpl({
    int? id,
    required String title,
    String? description,
    required DateTime deadLine,
    required bool complete,
    required int userID,
  }) : super._(
          id: id,
          title: title,
          description: description,
          deadLine: deadLine,
          complete: complete,
          userID: userID,
        );

  @override
  Task copyWith({
    Object? id = _Undefined,
    String? title,
    Object? description = _Undefined,
    DateTime? deadLine,
    bool? complete,
    int? userID,
  }) {
    return Task(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      deadLine: deadLine ?? this.deadLine,
      complete: complete ?? this.complete,
      userID: userID ?? this.userID,
    );
  }
}
