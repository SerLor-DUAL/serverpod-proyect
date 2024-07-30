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
import 'whatsapp_res.dart' as _i6;
import 'package:proyect_client/src/protocol/contacts/contacts.dart' as _i7;
import 'package:proyect_client/src/protocol/todolist/tasks.dart' as _i8;
import 'package:proyect_client/src/protocol/users/users_registry.dart' as _i9;
import 'package:shared_folder_santiago/proyect_shared.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'contacts/contacts.dart';
export 'todolist/tasks.dart';
export 'users/password_options.dart';
export 'users/users_registry.dart';
export 'whatsapp_res.dart';
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
    if (t == _i6.WhatsAppRes) {
      return _i6.WhatsAppRes.fromJson(data) as T;
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
    if (t == _i1.getType<_i6.WhatsAppRes?>()) {
      return (data != null ? _i6.WhatsAppRes.fromJson(data) : null) as T;
    }
    if (t == List<_i7.Contact>) {
      return (data as List).map((e) => deserialize<_i7.Contact>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.Task>) {
      return (data as List).map((e) => deserialize<_i8.Task>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.UsersRegistry>) {
      return (data as List)
          .map((e) => deserialize<_i9.UsersRegistry>(e))
          .toList() as dynamic;
    }
    if (t == _i10.MessageResponse) {
      return _i10.MessageResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i10.MessageResponse?>()) {
      return (data != null ? _i10.MessageResponse.fromJson(data) : null) as T;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i10.MessageResponse) {
      return 'MessageResponse';
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
    if (data is _i6.WhatsAppRes) {
      return 'WhatsAppRes';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'MessageResponse') {
      return deserialize<_i10.MessageResponse>(data['data']);
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
    if (data['className'] == 'WhatsAppRes') {
      return deserialize<_i6.WhatsAppRes>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
