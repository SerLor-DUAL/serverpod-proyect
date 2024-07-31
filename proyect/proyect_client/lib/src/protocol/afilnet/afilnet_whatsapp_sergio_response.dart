/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AfilnetWhatsAppSergioResponse implements _i1.SerializableModel {
  AfilnetWhatsAppSergioResponse._({
    required this.status,
    this.result,
    this.error,
  });

  factory AfilnetWhatsAppSergioResponse({
    required String status,
    String? result,
    String? error,
  }) = _AfilnetWhatsAppSergioResponseImpl;

  factory AfilnetWhatsAppSergioResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return AfilnetWhatsAppSergioResponse(
      status: jsonSerialization['status'] as String,
      result: jsonSerialization['result'] as String?,
      error: jsonSerialization['error'] as String?,
    );
  }

  String status;

  String? result;

  String? error;

  AfilnetWhatsAppSergioResponse copyWith({
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

class _AfilnetWhatsAppSergioResponseImpl extends AfilnetWhatsAppSergioResponse {
  _AfilnetWhatsAppSergioResponseImpl({
    required String status,
    String? result,
    String? error,
  }) : super._(
          status: status,
          result: result,
          error: error,
        );

  @override
  AfilnetWhatsAppSergioResponse copyWith({
    String? status,
    Object? result = _Undefined,
    Object? error = _Undefined,
  }) {
    return AfilnetWhatsAppSergioResponse(
      status: status ?? this.status,
      result: result is String? ? result : this.result,
      error: error is String? ? error : this.error,
    );
  }
}
