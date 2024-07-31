
import 'package:proyect_shared_santiago/proyect_shared_santiago.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_server/env/env.dart';
import 'dart:convert';

// ------------------------- Message App -----------------------------------\\
class MessageAppEndpoint extends Endpoint{
  final baseUrl = 'www.afilnet.com';
  final apiUsername = Env.apiUser;
  final apiPassword = Env.apiPassword;


  // SENDS A WHATSAPP MESSAGE
  Future<MessageResponse> sendMessageWpp(Session session, String phoneNumber, String message) async{
    // SET UP URL
    var url = Uri.https(baseUrl, '/api/http/' ,{
      'class' : 'whatsapp', 
      'method' : 'sendmessage', 
      'user' : apiUsername,        // USERNAME
      'password' : apiPassword ,   // PASSWORD
      'platformid' : '100',
      'destination' : phoneNumber, // Number to send message
      'message' : message  // Message content
      }
      );
    // GET RESPONSE AND RETURNS A MessageResponse
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessageResponse.fromJson(ret); 

  }
  // SENDS A SMS MESSAGE
  Future<MessageResponse> sendMessageSMS(Session session, String username, String phoneNumber, String message) async{
    // SET UP URL
    var url = Uri.https(baseUrl, '/api/http/', {
      'class' : 'sms', 
      'method' : 'sendsms', 
      'user' : apiUsername,        // USERNAME
      'password' : apiPassword,   // PASSWORD
      'from' : username,
      'to' : "34$phoneNumber", // Number to send message
      'sms' : message,  // Message content
      'scheduledatetime' : null,
      'output' : null
      }
      );
    // GET RESPONSE AND RETURNS A MessageResponse
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessageResponse.fromJson(ret); 
  }
}