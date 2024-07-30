class GenericApiResponse {
  final String status;
  final String? error;

  GenericApiResponse({
    required this.status,
    this.error,
  });

  // FACTORY CONSTRUCTOR TO CREATE A GENERICAPIRESPONSE FROM JSON
  factory GenericApiResponse.fromJson(Map<String, dynamic> json) 
  {
    return GenericApiResponse(
      status: json['status'] as String,
      error: json['error'] as String?,
    );
  }

  // METHOD TO CONVERT GENERICAPIRESPONSE TO JSON
  Map<String, dynamic> toJson() 
  {
    return {
      'status': status,
      'error': error,
    };
  }

  @override
  String toString() 
  {
    return 'GenericApiResponse(status: $status, error: $error)';
  }
}