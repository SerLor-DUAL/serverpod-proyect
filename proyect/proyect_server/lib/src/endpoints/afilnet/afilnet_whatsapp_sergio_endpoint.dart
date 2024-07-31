import 'dart:convert';
import 'package:proyect_server/env/env.dart';
import 'package:proyect_server/src/generated/afilnet/afilnet_whatsapp_sergio_response.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;

class AfilnetWhatsAppEndpoint extends Endpoint {

  @override
  bool get requireLogin => true;

  // METHOD TO SEND A MESSAGE USING THE AFILNET API
  Future<AfilnetWhatsAppSergioResponse> sendMessage(Session session, String destination, String message) async {

    // BASE URL OF THE AFILNET API ENDPOINT
    final baseUrl = 'www.afilnet.com';
    
    // CREATE A MAP OF PARAMETERS TO BE SENT IN THE HTTP REQUEST
    final Map<String, String> params = {
      'class': 'whatsapp',                // SPECIFY THE API CLASS TO USE
      'method': 'sendmessage',            // SPECIFY THE METHOD TO CALL
      'user': Env.apiUser,                // API USER
      'password': Env.apiPassword,        // API PASSWORD
      'platformid': '100',                // PLATFORM ID (SPECIFIC TO YOUR SETUP)
      'destination': destination,         // THE PHONE NUMBER TO SEND THE MESSAGE TO
      'message': message,                 // THE CONTENT OF THE MESSAGE
    };

    // BUILD THE FULL URL WITH QUERY PARAMETERS USING URI.HTTPS
    final uri = Uri.https(baseUrl, '/api/http/', params);

    // SEND AN HTTP GET REQUEST TO THE AFILNET API WITH THE QUERY PARAMETERS
    final response = await http.get(uri);

    // DEBUGGING DATA
    print('Request URL: ${uri.toString()}');
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    // CHECK IF THE HTTP RESPONSE STATUS CODE IS 200 (OK)
    if (response.statusCode == 200) 
    {
      // DECODE THE JSON RESPONSE BODY
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // CONVERT THE JSON RESPONSE INTO AN AFILNETRESPONSE OBJECT
      return AfilnetWhatsAppSergioResponse.fromJson(jsonResponse);
    } 
    else 
    {
      // IF THE RESPONSE STATUS CODE IS NOT 200, THROW AN EXCEPTION
      throw Exception('Failed to connect to Afilnet API: ${response.body}');
    }
  }
}