import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'package:proyect_server/env/env.dart';
import 'dart:convert';


class WhatsAppEndpoint extends Endpoint{
  final URL = 'www.afilnet.com';
  final api_username = Env.wppUser;
  final api_password = Env.wppPassword;


  Future<Map<String, String>> sendMessage(Session session,) async{
    var url = Uri.https(URL, '/api/http/' ,{'class' : 'whatsapp', 
                                                           'method' : 'sendmessage', 
                                                           'user' : api_username,
                                                           'password' : api_password,
                                                           'platformid' : '100',
                                                           'destination' : '34613704822',
                                                           'message' : 'Hola Santi'});
    var response = await http.get(url);
    final ret = jsonDecode(response.body); 
    return ret;
  }
}