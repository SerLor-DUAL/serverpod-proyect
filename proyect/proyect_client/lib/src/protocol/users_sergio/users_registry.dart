/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class UsersRegistry implements _i1.SerializableModel {
  UsersRegistry._({
    this.id,
    required this.userName,
    required this.userPassword,
    required this.options,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userName;

  String userPassword;

  int options;

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
