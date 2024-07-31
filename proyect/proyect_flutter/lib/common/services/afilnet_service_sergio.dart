import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_shared_sergio/proyect_shared_sergio.dart';

class AfilnetServiceSergio {

  final Client client;
  AfilnetServiceSergio(this.client);

  // METHOD TO SEND A MESSAGE USING THE AFILNET API
  // PRINCIPAL PARAMETERS:
    // DESTINATION: THE PHONE NUMBER TO WHICH THE MESSAGE WILL BE SENT
    // MESSAGE: THE CONTENT OF THE MESSAGE TO BE SENT

  Future<AfilnetWhatsAppResponse> sendMessage(String destination, String message) async 
  {

    // CALL THE SENDMESSAGE METHOD FROM THE AFILNET ENDPOINT ON THE CLIENT
    // THIS METHOD SENDS THE REQUEST TO THE SERVER WHICH WILL HANDLE THE INTERACTION WITH THE AFILNET API
    final response = await client.afilnetWhatsApp.sendMessage(destination, message);

    // RETURN THE RESPONSE FROM THE SERVER, THE RESPONSE IS EXPECTED TO BE OF TYPE AFILNETRESPONSE
    return response;
  }

  Future<GenericApiResponse> sendSms(String destinationPhone, String message, {DateTime? scheduleDateTime}) async 
  {
    // CALL THE SENDMESSAGE METHOD FROM THE AFILNET ENDPOINT ON THE CLIENT
    // THIS METHOD SENDS THE REQUEST TO THE SERVER WHICH WILL HANDLE THE INTERACTION WITH THE AFILNET API
      // ES FOR SPAIN
    final response = await client.afilnetSms.sendSms('ES', destinationPhone, message, scheduleDateTime: scheduleDateTime);

    // RETURN THE RESPONSE FROM THE SERVER, THE RESPONSE IS EXPECTED TO BE OF TYPE AFILNETRESPONSE
    return response;
  }
}
