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

abstract class PasswordGenerator implements _i1.SerializableModel {
  PasswordGenerator._({
    this.id,
    required this.optionsId,
    this.options,
    required this.password,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int optionsId;

  _i2.PasswordOptions? options;

  String password;

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
