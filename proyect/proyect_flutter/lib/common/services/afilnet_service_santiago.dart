import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_shared_santiago/proyect_shared_santiago.dart';

class AfilnetServiceSantiago {

  final Client client;
  AfilnetServiceSantiago(this.client);

  // METHOD TO SEND A MESSAGE USING THE AFILNET API
  // PRINCIPAL PARAMETERS:
    // PHONENUMBER: THE PHONE NUMBER TO WHICH THE MESSAGE WILL BE SENT
    // MESSAGE: THE CONTENT OF THE MESSAGE TO BE SENT

  Future<MessageResponse> sendMessage(String phoneNumber, String message) async 
  {
    // CALL THE SENDMESSAGE METHOD FROM THE AFILNET ENDPOINT ON THE CLIENT
    // THIS METHOD SENDS THE REQUEST TO THE SERVER WHICH WILL HANDLE THE INTERACTION WITH THE AFILNET API
    MessageResponse response = await client.messageApp.sendMessageWpp(phoneNumber, message);

    // RETURN THE RESPONSE FROM THE SERVER, THE RESPONSE IS EXPECTED TO BE OF TYPE MESSAGERESPONSE
    return response;
  }

  Future<MessageResponse> sendSms(String customSenderUser, String destinationPhone, String message) async 
  {
    // CALL THE SENDMESSAGE METHOD FROM THE AFILNET ENDPOINT ON THE CLIENT
    // THIS METHOD SENDS THE REQUEST TO THE SERVER WHICH WILL HANDLE THE INTERACTION WITH THE AFILNET API
    
    final response = await client.messageApp.sendMessageSMS(customSenderUser, destinationPhone, message);

    // RETURN THE RESPONSE FROM THE SERVER, THE RESPONSE IS EXPECTED TO BE OF TYPE AFILNETRESPONSE
    return response;
  }
}
