import 'package:folder_shared/message_response.dart';
import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_server/env/env.dart';
import 'dart:convert';


class WhatsAppEndpoint extends Endpoint{
  final URL = 'www.afilnet.com';
  final api_username = Env.apiUser;
  final api_password = Env.apiPassword;


  // SENDS A COMMON MESSAGE
  Future<MessageResponse> sendMessageWpp(Session session, String phoneNumber, String message) async{
    // SET UP URL
    var url = Uri.https(URL, '/api/http/' ,{
      'class' : 'whatsapp', 
      'method' : 'sendmessage', 
      'user' : api_username,        // USERNAME
      'password' : api_password ,   // PASSWORD
      'platformid' : '100',
      'destination' : phoneNumber, // Number to send message
      'message' : message  // Message content
      }
      );
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessageResponse.fromJson(ret); 

  }
  // SENDS A SMS MESSAGE
  Future<MessageResponse> sendMessageSMS(Session session, String username, String phoneNumber, String message) async{
    // SET UP URL
    var url = Uri.https(URL, '/api/http/', {
      'class' : 'sms', 
      'method' : 'sendsms', 
      'user' : api_username,        // USERNAME
      'password' : api_password,   // PASSWORD
      'from' : username,
      'to' : "34$phoneNumber", // Number to send message
      'sms' : message,  // Message content
      'scheduledatetime' : null,
      'output' : null
      }
      );
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessageResponse.fromJson(ret); 

  }

}