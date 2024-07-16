/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class UsersRegistry implements _i1.SerializableModel {
  UsersRegistry._({
    this.id,
    required this.userName,
    required this.userPasswordId,
    this.userPassword,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userName;

  int userPasswordId;

  _i2.PasswordGenerator? userPassword;

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
