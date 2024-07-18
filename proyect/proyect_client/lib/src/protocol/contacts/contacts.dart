/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Contact implements _i1.SerializableModel {
  Contact._({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.userID,
  });

  factory Contact({
    int? id,
    required String name,
    required String phoneNumber,
    required int userID,
  }) = _ContactImpl;

  factory Contact.fromJson(Map<String, dynamic> jsonSerialization) {
    return Contact(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      userID: jsonSerialization['userID'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String phoneNumber;

  int userID;

  Contact copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    int? userID,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'userID': userID,
    };
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
    required int userID,
  }) : super._(
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          userID: userID,
        );

  @override
  Contact copyWith({
    Object? id = _Undefined,
    String? name,
    String? phoneNumber,
    int? userID,
  }) {
    return Contact(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userID: userID ?? this.userID,
    );
  }
}
