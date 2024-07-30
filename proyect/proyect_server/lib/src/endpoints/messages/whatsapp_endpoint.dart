import 'package:proyect_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_server/src/env/env.dart';

import 'dart:convert';


class MessagesEndpoint extends Endpoint{
  final URL = 'www.afilnet.com';
  final api_username = Env.apiUser;
  final api_password = Env.apiPassword;
  /*

  // SENDS A COMMON MESSAGE
  Future<MessagesAppRes> sendMessageWpp(Session session, String phoneNumber, String message) async{
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
    return MessagesAppRes.fromJson(ret); 
  }
  Future<MessagesAppRes> sendImgWpp(Session session, String phoneNumber, String message, String imgURL, [String? thumbURL]) async{
    // SET UP URL
    var url = Uri.https(URL, '/api/http/' ,{
      'class' : 'whatsapp', 
      'method' : 'sendmessage', 
      'user' : api_username,        // USERNAME
      'password' : api_password ,   // PASSWORD
      'platformid' : '100',
      'destination' : phoneNumber, // Number to send message
      'type' : 'image',
      'fileurl' : imgURL,   // IMG URL
      'thumbURL' : thumbURL?? imgURL, // THUMBNAILS URL
      'message' : message  // Message content
      }
      );
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessagesAppRes.fromJson(ret); 
  }

  // SENDS A COMMON MESSAGE THROUGH SMS
  Future<MessagesAppRes> sendMessageSMS(Session session, String username, String phoneNumber, String message) async{
    // SET UP URL
    var url = Uri.https(URL, '/api/http/' ,{
      'class' : 'sms', 
      'method' : 'sendsms', 
      'user' : api_username,        // USERNAME
      'password' : api_password ,   // PASSWORD
      'from' : username,
      'to' : phoneNumber, // Number to send message
      'sms' : message  // Message content
      }
      );
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return MessagesAppRes.fromJson(ret); 
  }
  */
}