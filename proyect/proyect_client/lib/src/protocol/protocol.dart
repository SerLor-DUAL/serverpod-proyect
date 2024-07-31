/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'afilnet/afilnet_whatsapp_response.dart' as _i2;
import 'contacts/contacts.dart' as _i3;
import 'todolist/tasks.dart' as _i4;
import 'users/password_options.dart' as _i5;
import 'users/users_registry.dart' as _i6;
import 'whatsapp_res.dart' as _i7;
import 'package:proyect_client/src/protocol/contacts/contacts.dart' as _i8;
import 'package:proyect_client/src/protocol/todolist/tasks.dart' as _i9;
import 'package:proyect_client/src/protocol/users/users_registry.dart' as _i10;
import 'package:proyect_shared_sergio/proyect_shared_sergio.dart' as _i11;
import 'package:proyect_shared_santiago/proyect_shared_santiago.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'afilnet/afilnet_whatsapp_response.dart';
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
    if (t == _i2.AfilnetWhatsAppResponse) {
      return _i2.AfilnetWhatsAppResponse.fromJson(data) as T;
    }
    if (t == _i3.Contact) {
      return _i3.Contact.fromJson(data) as T;
    }
    if (t == _i4.Task) {
      return _i4.Task.fromJson(data) as T;
    }
    if (t == _i5.PasswordOptions) {
      return _i5.PasswordOptions.fromJson(data) as T;
    }
    if (t == _i6.UsersRegistry) {
      return _i6.UsersRegistry.fromJson(data) as T;
    }
    if (t == _i7.WhatsAppRes) {
      return _i7.WhatsAppRes.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AfilnetWhatsAppResponse?>()) {
      return (data != null ? _i2.AfilnetWhatsAppResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i3.Contact?>()) {
      return (data != null ? _i3.Contact.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Task?>()) {
      return (data != null ? _i4.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.PasswordOptions?>()) {
      return (data != null ? _i5.PasswordOptions.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.UsersRegistry?>()) {
      return (data != null ? _i6.UsersRegistry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.WhatsAppRes?>()) {
      return (data != null ? _i7.WhatsAppRes.fromJson(data) : null) as T;
    }
    if (t == List<_i8.Contact>) {
      return (data as List).map((e) => deserialize<_i8.Contact>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Task>) {
      return (data as List).map((e) => deserialize<_i9.Task>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.UsersRegistry>) {
      return (data as List)
          .map((e) => deserialize<_i10.UsersRegistry>(e))
          .toList() as dynamic;
    }
    if (t == _i11.GenericApiRequest) {
      return _i11.GenericApiRequest.fromJson(data) as T;
    }
    if (t == _i11.GenericApiResponse) {
      return _i11.GenericApiResponse.fromJson(data) as T;
    }
    if (t == _i12.MessageResponse) {
      return _i12.MessageResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i11.GenericApiRequest?>()) {
      return (data != null ? _i11.GenericApiRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.GenericApiResponse?>()) {
      return (data != null ? _i11.GenericApiResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.MessageResponse?>()) {
      return (data != null ? _i12.MessageResponse.fromJson(data) : null) as T;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i11.GenericApiRequest) {
      return 'GenericApiRequest';
    }
    if (data is _i11.GenericApiResponse) {
      return 'GenericApiResponse';
    }
    if (data is _i12.MessageResponse) {
      return 'MessageResponse';
    }
    if (data is _i2.AfilnetWhatsAppResponse) {
      return 'AfilnetWhatsAppResponse';
    }
    if (data is _i3.Contact) {
      return 'Contact';
    }
    if (data is _i4.Task) {
      return 'Task';
    }
    if (data is _i5.PasswordOptions) {
      return 'PasswordOptions';
    }
    if (data is _i6.UsersRegistry) {
      return 'UsersRegistry';
    }
    if (data is _i7.WhatsAppRes) {
      return 'WhatsAppRes';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'GenericApiRequest') {
      return deserialize<_i11.GenericApiRequest>(data['data']);
    }
    if (data['className'] == 'GenericApiResponse') {
      return deserialize<_i11.GenericApiResponse>(data['data']);
    }
    if (data['className'] == 'MessageResponse') {
      return deserialize<_i12.MessageResponse>(data['data']);
    }
    if (data['className'] == 'AfilnetWhatsAppResponse') {
      return deserialize<_i2.AfilnetWhatsAppResponse>(data['data']);
    }
    if (data['className'] == 'Contact') {
      return deserialize<_i3.Contact>(data['data']);
    }
    if (data['className'] == 'Task') {
      return deserialize<_i4.Task>(data['data']);
    }
    if (data['className'] == 'PasswordOptions') {
      return deserialize<_i5.PasswordOptions>(data['data']);
    }
    if (data['className'] == 'UsersRegistry') {
      return deserialize<_i6.UsersRegistry>(data['data']);
    }
    if (data['className'] == 'WhatsAppRes') {
      return deserialize<_i7.WhatsAppRes>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
