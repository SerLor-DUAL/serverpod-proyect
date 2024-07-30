
class MessagesAppRes {
  String status;
  Map<String,dynamic>? result;
  String? error;

  MessagesAppRes(this.status, this.result, this.error);

  factory MessagesAppRes.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return MessagesAppRes(
      jsonSerialization['status'],
      jsonSerialization['result'],
      jsonSerialization['error']
    );
  }
}