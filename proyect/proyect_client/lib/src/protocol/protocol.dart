/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'todo_list_santi/tasks.dart' as _i3;
import 'users_sergio/password_generator.dart' as _i4;
import 'users_sergio/password_options.dart' as _i5;
import 'users_sergio/users_registry.dart' as _i6;
export 'example.dart';
export 'todo_list_santi/tasks.dart';
export 'users_sergio/password_generator.dart';
export 'users_sergio/password_options.dart';
export 'users_sergio/users_registry.dart';
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
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data) as T;
    }
    if (t == _i3.Task) {
      return _i3.Task.fromJson(data) as T;
    }
    if (t == _i4.PasswordGenerator) {
      return _i4.PasswordGenerator.fromJson(data) as T;
    }
    if (t == _i5.PasswordOptions) {
      return _i5.PasswordOptions.fromJson(data) as T;
    }
    if (t == _i6.UsersRegistry) {
      return _i6.UsersRegistry.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Task?>()) {
      return (data != null ? _i3.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PasswordGenerator?>()) {
      return (data != null ? _i4.PasswordGenerator.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PasswordOptions?>()) {
      return (data != null ? _i5.PasswordOptions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.UsersRegistry?>()) {
      return (data != null ? _i6.UsersRegistry.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.Task) {
      return 'Task';
    }
    if (data is _i4.PasswordGenerator) {
      return 'PasswordGenerator';
    }
    if (data is _i5.PasswordOptions) {
      return 'PasswordOptions';
    }
    if (data is _i6.UsersRegistry) {
      return 'UsersRegistry';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'Task') {
      return deserialize<_i3.Task>(data['data']);
    }
    if (data['className'] == 'PasswordGenerator') {
      return deserialize<_i4.PasswordGenerator>(data['data']);
    }
    if (data['className'] == 'PasswordOptions') {
      return deserialize<_i5.PasswordOptions>(data['data']);
    }
    if (data['className'] == 'UsersRegistry') {
      return deserialize<_i6.UsersRegistry>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
