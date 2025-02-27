import 'package:serverpod/serverpod.dart';
import '../../generated/contacts/contacts.dart';

class ContactEndpoint extends Endpoint {

  // WHAT Session is? When a call is generated to the sv, a
  // Session is created, it has all the current data.

  // AUTHORIZATION METHOD. THIS ENDPOINT REQUIRES THE USER TO BE LOGGED IN.
  @override
  bool get requireLogin => true;

  //DB ENDPOINT METHODS
  
  // CREATE
  
  Future<void> addContact(Session session, Contact contact) async {
    await Contact.db.insertRow(session, contact);
  }
  Future<void> addListOfContacts(Session session, List<Contact> contacts) async {
    await Contact.db.insert(session, contacts);
  }

  // READ
  
  Future<Contact?> findById(Session session, int contactID) async {
    return await Contact.db.findById(session, contactID);
  }
  // Return a List with contacts. Ordered by contact's name.
  Future<List<Contact>> getEveryContactByUser(
      Session session, int userID) async {
    return await Contact.db.find(session,
        orderBy: (contact) => contact.name,
        where: (contact) => contact.userID.equals(userID));
  }

  Future<bool> isContactOnList(Session session, String phoneNumber, int userID) async {
    Contact? contactFound = await Contact.db.findFirstRow(
                                                session,
                                                where: (contact) => contact.phoneNumber.equals(phoneNumber) & 
                                                       (contact.userID.equals(userID)));
    return (contactFound == null)? false : true;
  }

  // UPDATE
  Future<void> updateContact(Session session, Contact? contact) async {
    if (contact != null){
      await Contact.db.updateRow(session, contact);
    }
    throw Error();
  }

  // DELETE
  Future<void> deleteContact(Session session, Contact contact) async {
    await Contact.db.deleteRow(session, contact);
  }

  Future<void> deleteMultipleContacts(Session session, List<Contact> tasks) async {
    await Contact.db.delete(session, tasks);
  }

}