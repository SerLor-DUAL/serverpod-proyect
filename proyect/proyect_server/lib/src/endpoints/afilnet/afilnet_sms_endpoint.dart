
import 'package:proyect_server/env/env.dart';
import 'package:serverpod/serverpod.dart';
import 'package:proyect_shared_sergio/proyect_shared_sergio.dart';
import 'package:http/http.dart' as http;

class AfilnetSmsEndpoint extends Endpoint {

  @override
  bool get requireLogin => true;

  final Map<String, String> countryCodes = {
    'ES': '34',  // España
    'FR': '33',  // Francia
    'IT': '39',  // Italia
    'DE': '49',  // Alemania
    'PT': '351', // Portugal
    'AR': '54',  // Argentina
    'BR': '55',  // Brasil
    'CL': '56',  // Chile
    'CO': '57',  // Colombia
    'MX': '52',  // México
    'PE': '51',  // Perú
    'VE': '58',  // Venezuela
  };

  // ADDS THE DESIRED NUMBER ON A COUNTRY SELECTION
  String formatPhoneNumber(String countryCode, String phoneNumber) {
    final code = countryCodes[countryCode];
    if (code == null) 
    {
      throw Exception('Country code not found!');
    }

    if (phoneNumber.startsWith(code))
    {
      return phoneNumber;
    }

    return '$code$phoneNumber';
  }

  // METHOD TO SEND AN SMS USING THE AFILNET API
  Future<GenericApiResponse> sendSms(Session session, String countryCode, String destinationPhone, String message, {DateTime? scheduleDateTime}) async 
  {

     print('Session: ${session.toString()}');

    // BASE URL OF THE AFILNET API ENDPOINT
    final baseUrl = 'www.afilnet.com';

    // PHONE REFORMAT
    final formattedPhoneNumber = formatPhoneNumber(countryCode, destinationPhone);

    // CREATE A MAP OF PARAMETERS TO BE SENT IN THE HTTP REQUEST
    final Map<String, dynamic> params = {
      'class': 'sms',                                                               // SPECIFY THE API CLASS TO USE FOR SMS
      'method': 'sendsms',                                                          // SPECIFY THE METHOD TO CALL FOR SENDING SMS
      'user': Env.apiUser,                                                          // API USER CREDENTIAL
      'password': Env.apiPassword,                                                  // API PASSWORD CREDENTIAL
      'from': 'Afilnet',                                                            // SENDER ID TO BE DISPLAYED
      'to': formattedPhoneNumber,                                                   // THE PHONE NUMBER TO WHICH THE SMS WILL BE SENT
      'sms': message,                                                               // THE CONTENT OF THE SMS
      'scheduledatetime': scheduleDateTime?.toUtc().toIso8601String() ?? '',        // OPTIONALLY ADD THE SCHEDULE DATE AND TIME IF PROVIDED
      'output': 'json',                                                             // OPTIONAL OUTPUT FORMAT, LEFT EMPTY IF NOT REQUIRED
    };

    // BUILD THE FULL URL WITH QUERY PARAMETERS USING URI.HTTPS
    final uri = Uri.https(baseUrl, '/api/http/', params);

    // SEND AN HTTP GET REQUEST TO THE AFILNET API WITH THE QUERY PARAMETERS -- DEBUG TRYING
    final response = await http.get(uri);
    print(response.toString());

    // CREATE AN INSTANCE OF GENERICAPIREQUEST WITH THE BASE URL AND PARAMETERS
    final apiRequest = GenericApiRequest(
      endpoint: uri.toString(),
      parameters: params
    );

    try 
    {
      // SEND THE POST REQUEST AND GET THE RESPONSE
      final responseJson = await apiRequest.sendPost();

      // CONVERT THE JSON RESPONSE INTO A GENERICAPIRESPONSE OBJECT
      return GenericApiResponse.fromJson(responseJson);
    } 
    catch (e) 
    {
      // HANDLE ERRORS BY THROWING AN EXCEPTION WITH A DESCRIPTIVE MESSAGE
      throw Exception('Failed to send SMS: ${e.toString()}');
    }
  }
}
