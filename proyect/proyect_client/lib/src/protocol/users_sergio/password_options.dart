/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class PasswordOptions implements _i1.SerializableModel {
  PasswordOptions._({
    this.id,
    this.passwordLengthOption,
    this.upperOption,
    this.numberOption,
    this.specialOption,
    required this.automatedPassword,
  });

  factory PasswordOptions({
    int? id,
    int? passwordLengthOption,
    bool? upperOption,
    bool? numberOption,
    bool? specialOption,
    required bool automatedPassword,
  }) = _PasswordOptionsImpl;

  factory PasswordOptions.fromJson(Map<String, dynamic> jsonSerialization) {
    return PasswordOptions(
      id: jsonSerialization['id'] as int?,
      passwordLengthOption: jsonSerialization['passwordLengthOption'] as int?,
      upperOption: jsonSerialization['upperOption'] as bool?,
      numberOption: jsonSerialization['numberOption'] as bool?,
      specialOption: jsonSerialization['specialOption'] as bool?,
      automatedPassword: jsonSerialization['automatedPassword'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? passwordLengthOption;

  bool? upperOption;

  bool? numberOption;

  bool? specialOption;

  bool automatedPassword;

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
      if (passwordLengthOption != null)
        'passwordLengthOption': passwordLengthOption,
      if (upperOption != null) 'upperOption': upperOption,
      if (numberOption != null) 'numberOption': numberOption,
      if (specialOption != null) 'specialOption': specialOption,
      'automatedPassword': automatedPassword,
    };
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
    int? passwordLengthOption,
    bool? upperOption,
    bool? numberOption,
    bool? specialOption,
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
    Object? passwordLengthOption = _Undefined,
    Object? upperOption = _Undefined,
    Object? numberOption = _Undefined,
    Object? specialOption = _Undefined,
    bool? automatedPassword,
  }) {
    return PasswordOptions(
      id: id is int? ? id : this.id,
      passwordLengthOption: passwordLengthOption is int?
          ? passwordLengthOption
          : this.passwordLengthOption,
      upperOption: upperOption is bool? ? upperOption : this.upperOption,
      numberOption: numberOption is bool? ? numberOption : this.numberOption,
      specialOption:
          specialOption is bool? ? specialOption : this.specialOption,
      automatedPassword: automatedPassword ?? this.automatedPassword,
    );
  }
}
