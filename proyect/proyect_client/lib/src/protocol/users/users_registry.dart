/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;

abstract class UsersRegistry implements _i1.SerializableModel {
  UsersRegistry._({
    this.id,
    required this.userName,
    required this.userPassword,
    required this.options,
    required this.userInfoId,
    this.userInfo,
  });

  factory UsersRegistry({
    int? id,
    required String userName,
    required String userPassword,
    required int options,
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) = _UsersRegistryImpl;

  factory UsersRegistry.fromJson(Map<String, dynamic> jsonSerialization) {
    return UsersRegistry(
      id: jsonSerialization['id'] as int?,
      userName: jsonSerialization['userName'] as String,
      userPassword: jsonSerialization['userPassword'] as String,
      options: jsonSerialization['options'] as int,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String userName;

  String userPassword;

  int options;

  int userInfoId;

  _i2.UserInfo? userInfo;

  UsersRegistry copyWith({
    int? id,
    String? userName,
    String? userPassword,
    int? options,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userName': userName,
      'userPassword': userPassword,
      'options': options,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
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
    required int userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          userName: userName,
          userPassword: userPassword,
          options: options,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  @override
  UsersRegistry copyWith({
    Object? id = _Undefined,
    String? userName,
    String? userPassword,
    int? options,
    int? userInfoId,
    Object? userInfo = _Undefined,
  }) {
    return UsersRegistry(
      id: id is int? ? id : this.id,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      options: options ?? this.options,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}
