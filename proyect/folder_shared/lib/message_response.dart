class MessageResponse {
  String status;
  Map<String, dynamic>? result;
  String? error;
  MessageResponse(this.status, this.result, this.error);

  factory MessageResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MessageResponse(
      jsonSerialization['status'],
      jsonSerialization['result'],
      jsonSerialization['error']
    );
  }
}