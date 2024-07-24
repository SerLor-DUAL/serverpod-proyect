/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'contacts/contacts.dart' as _i2;
import 'todolist/tasks.dart' as _i3;
import 'users/password_options.dart' as _i4;
import 'users/users_registry.dart' as _i5;
import 'package:proyect_client/src/protocol/contacts/contacts.dart' as _i6;
import 'package:proyect_client/src/protocol/todolist/tasks.dart' as _i7;
import 'package:proyect_client/src/protocol/users/users_registry.dart' as _i8;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i9;
export 'contacts/contacts.dart';
export 'todolist/tasks.dart';
export 'users/password_options.dart';
export 'users/users_registry.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Contact) {
      return _i2.Contact.fromJson(data) as T;
    }
    if (t == _i3.Task) {
      return _i3.Task.fromJson(data) as T;
    }
    if (t == _i4.PasswordOptions) {
      return _i4.PasswordOptions.fromJson(data) as T;
    }
    if (t == _i5.UsersRegistry) {
      return _i5.UsersRegistry.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Contact?>()) {
      return (data != null ? _i2.Contact.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Task?>()) {
      return (data != null ? _i3.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PasswordOptions?>()) {
      return (data != null ? _i4.PasswordOptions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.UsersRegistry?>()) {
      return (data != null ? _i5.UsersRegistry.fromJson(data) : null) as T;
    }
    if (t == List<_i6.Contact>) {
      return (data as List).map((e) => deserialize<_i6.Contact>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Task>) {
      return (data as List).map((e) => deserialize<_i7.Task>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.UsersRegistry>) {
      return (data as List)
          .map((e) => deserialize<_i8.UsersRegistry>(e))
          .toList() as dynamic;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i9.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Contact) {
      return 'Contact';
    }
    if (data is _i3.Task) {
      return 'Task';
    }
    if (data is _i4.PasswordOptions) {
      return 'PasswordOptions';
    }
    if (data is _i5.UsersRegistry) {
      return 'UsersRegistry';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i9.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Contact') {
      return deserialize<_i2.Contact>(data['data']);
    }
    if (data['className'] == 'Task') {
      return deserialize<_i3.Task>(data['data']);
    }
    if (data['className'] == 'PasswordOptions') {
      return deserialize<_i4.PasswordOptions>(data['data']);
    }
    if (data['className'] == 'UsersRegistry') {
      return deserialize<_i5.UsersRegistry>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
