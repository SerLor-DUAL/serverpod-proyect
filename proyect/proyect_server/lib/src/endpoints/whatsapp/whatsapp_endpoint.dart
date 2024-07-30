import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_server/env/env.dart';
import 'dart:convert';


class WhatsAppEndpoint extends Endpoint{
  final URL = 'www.afilnet.com';
  final api_username = Env.wppUser;
  final api_password = Env.wppPassword;


  // SENDS A COMMON MESSAGE
  Future<WhatsAppRes> sendMessage(Session session, String phoneNumber, String message) async{
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
    return WhatsAppRes.fromJson(ret); 

  }

}