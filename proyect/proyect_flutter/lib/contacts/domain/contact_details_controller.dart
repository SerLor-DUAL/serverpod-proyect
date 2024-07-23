part of '../presentation/contact_details.dart';

abstract class ContactDetailsController extends State<ContactDetails> {
// DELETE TASK
  Future<void> deleteContact(Contact contact) async {
    await client.contact.deleteContact(contact);
  }
}
