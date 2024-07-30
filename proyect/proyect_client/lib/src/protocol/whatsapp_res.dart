/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class WhatsAppRes implements _i1.SerializableModel {
  WhatsAppRes._({
    required this.status,
    this.result,
    this.error,
  });

  factory WhatsAppRes({
    required String status,
    String? result,
    String? error,
  }) = _WhatsAppResImpl;

  factory WhatsAppRes.fromJson(Map<String, dynamic> jsonSerialization) {
    return WhatsAppRes(
      status: jsonSerialization['status'] as String,
      result: jsonSerialization['result'] as String?,
      error: jsonSerialization['error'] as String?,
    );
  }

  String status;

  String? result;

  String? error;

  WhatsAppRes copyWith({
    String? status,
    String? result,
    String? error,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (result != null) 'result': result,
      if (error != null) 'error': error,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WhatsAppResImpl extends WhatsAppRes {
  _WhatsAppResImpl({
    required String status,
    String? result,
    String? error,
  }) : super._(
          status: status,
          result: result,
          error: error,
        );

  @override
  WhatsAppRes copyWith({
    String? status,
    Object? result = _Undefined,
    Object? error = _Undefined,
  }) {
    return WhatsAppRes(
      status: status ?? this.status,
      result: result is String? ? result : this.result,
      error: error is String? ? error : this.error,
    );
  }
}
