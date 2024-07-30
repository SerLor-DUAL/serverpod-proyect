import 'dart:convert';
import 'package:http/http.dart' as http;

class GenericApiRequest {
  final String endpoint; // THE URL OF THE API ENDPOINT
  final Map<String, dynamic> parameters; // PARAMETERS TO BE SENT IN THE REQUEST

  GenericApiRequest({
    required this.endpoint,
    required this.parameters,
  });

  // CONVERT THE PARAMETERS MAP TO A QUERY STRING FORMAT
  String toQueryString() {
    return parameters.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }

  // SEND A POST REQUEST AND RETURN THE RESPONSE AS A MAP
  Future<Map<String, dynamic>> sendPost() async {
    final url = Uri.parse(endpoint); 
    final body = toQueryString();

    final response = await http.post(
      url,
      body: body,
    );

    // PRINT RESPONSE DETAILS FOR DEBUGGING PURPOSES
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) 
    {
      // DECODE AND RETURN THE RESPONSE BODY AS A MAP
      return json.decode(response.body) as Map<String, dynamic>;
    } 
    else 
    {
      // THROW AN EXCEPTION IF THE RESPONSE STATUS IS NOT 200
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }

  // FACTORY CONSTRUCTOR TO CREATE A GENERICAPIREQUEST INSTANCE FROM JSON
  factory GenericApiRequest.fromJson(Map<String, dynamic> json) 
  {
    return GenericApiRequest(
      endpoint: json['endpoint'] as String,
      parameters: Map<String, dynamic>.from(json['parameters'] as Map),
    );
  }

  // CONVERT GENERICAPIREQUEST INSTANCE TO JSON
  Map<String, dynamic> toJson() 
  {
    return {
      'endpoint': endpoint,
      'parameters': parameters,
    };
  }
}