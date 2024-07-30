part of '../presentation/contact_details.dart';

abstract class ContactDetailsController extends State<ContactDetails> with TickerProviderStateMixin 
{

  @override
  void initState() 
  {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);     // INITIALIZE TAB CONTROLLER WITH 2 TABS AND A TICKER PROVIDER
    _afilnetService = AfilnetService(widget.client);            // INITIALIZE THE AFILNET SERVICE WITH THE CLIENT
    _tabController.addListener(_handleTabChange);               // ADD A LISTENER TO HANDLE TAB CHANGES
  }

  // --------------------------- TAB FUNCTIONS ---------------------------------//

  // TAB CONTROLLER TO MANAGE TABS IN THE UI
  late TabController _tabController;

  // HANDLES CHANGES BETWEEN TABS
  void _handleTabChange() 
  {
    if (_tabController.indexIsChanging && _tabController.index == 1) 
    {
      widget.updateHomeIndex(1);
    }
  }

  // ----------------------------------------------------------------------------//

  // SERVICE FOR INTERACTING WITH THE AFILNET API
  late AfilnetService _afilnetService;

  // TEXT CONTROLLER FOR THE MESSAGE INPUT
  final TextEditingController _messageController = TextEditingController();

  // -------------------------- SMS FUNCTIONS -----------------------------------//

  void _sendSms() async {
    String sms = _messageController.text;
    try {
      final response = await _afilnetService.sendSms(
        widget.contact.phoneNumber,
        sms,
      );
      if (response.status == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SMS sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send SMS: ${response.error}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send SMS: $e')),
      );
    }
  }

  // ----------------------------------------------------------------------------//

  // ---------------------- MESSAGING FUNCTIONS ---------------------------------//

  // SEND A MESSAGE USING THE AFILNET SERVICE
  void _sendMessage() async 
  {
    String message = _messageController.text;
    try 
    {
      // CALL THE SERVICE TO SEND THE MESSAGE
      final response = await _afilnetService.sendMessage(widget.contact.phoneNumber, message);
      if (response.status == 'success') 
      {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),  // SHOW SUCCESS SNACKBAR IF MESSAGE SENT SUCCESSFULLY
        );
      } 
      else 
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: ${response.error}')), // SHOW ERROR SNACKBAR IF MESSAGE SENDING FAILED
        );
      }
    } 
    catch (e) 
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message: $e')),  // SHOW ERROR SNACKBAR IF AN EXCEPTION OCCURS
      );
    }
  }

  // ----------------------------------------------------------------------------//

    // ------------------------ CONTACT FUNCTIONS ---------------------------------//

  // TEXT CONTROLLERS FOR CONTACT DATA
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();

  // RETURNS TRUE IF THE PHONE NUMBER MATCHES THE EXPECTED FORMAT
  bool _isPhoneMatch(String phoneNumber) 
  {
    RegExp exp = RegExp(r'^[0-9]{9}$');
    return exp.hasMatch(phoneNumber);
  }

  // CHECK IF THE CONTACT IS ALREADY IN THE LIST OR PHONE NUMBER IS VALID
  Future<Map<String, String>?> _checkIfContactIsOnList() async 
  {
    Map<String, String>? error;

    if (_isPhoneMatch(_phoneCon.text)) 
    {
      bool isContactOnList = await widget.client.contact.isContactOnList(_phoneCon.text, widget.user.id!);

      if (isContactOnList) 
      {
        if (widget.contact.phoneNumber != _phoneCon.text) 
        {
          error = {
            'errorTitle': 'Contact in list',
            'errorMessage': 'That contact is already in the list'
          };
        }
      }
    } 
    else 
    {
      error = {
        'errorTitle': "Phone doesn't match",
        'errorMessage': 'Phone must have 9 nums'
      };
    }
    return error;
  }

  // ------------------------ UPDATE FUNCTIONS ---------------------------------//

  // UPDATE THE CONTACT'S PROFILE PICTURE
  Future<void> _updateContactPicture() async 
  {
    await showDialog(
      context: context,
      builder: (context) {
        return ProfilePictureSelector(
          contact: widget.contact,
          client: widget.client,
        );
      }
    );
  }

  // UPDATES CONTACT DATA BASED ON CONTROLLER INPUT
  Contact _updateContactWithData() 
  {
    Contact updatedContact = widget.contact;
    updatedContact.name = (_nameCon.text == '') ? updatedContact.name : _nameCon.text;
    updatedContact.phoneNumber = (_phoneCon.text == '') ? updatedContact.phoneNumber : _phoneCon.text;
    Navigator.pop(context);
    return updatedContact;
  }

  // UPDATE THE CONTACT IF NO ERROR OCCURS, OTHERWISE SHOW ERROR DIALOG
  Future<void> _updateContact() async 
  {
    Map<String, String>? error =
        await _checkIfContactIsOnList();
    if (error == null) 
    {
      Contact updatedContact = _updateContactWithData();
      await widget.client.contact.updateContact(updatedContact);
    } 
    else 
    {
      if (mounted) 
      {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              customTitle: error["errorTitle"]!,
              customContent: error["errorMessage"]!,
            );
          }
        );
      }
    }
  }

  // CUSTOM INPUT DIALOG FOR UPDATING CONTACT DETAILS
  Future<void> _askForUpdateToDoInput() async 
  {
    _nameCon.text = widget.contact.name;
    _phoneCon.text = widget.contact.phoneNumber;
    await showDialog(
      context: context,
      builder: (BuildContext context) => CustomInputDialog(
        client: widget.client,
        title: 'Edit Contact',
        content: null, // NO CONTENT REQUIRED HERE
        textControllers: [_nameCon, _phoneCon],
        labels: const ['Name', 'Phone'],
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _updateContact();
            },
            child: const Text('Edit Contact'),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------------------------//

  // ------------------------ DELETE FUNCTIONS ----------------------------------//

  // DELETE THE SPECIFIED CONTACT
  Future<void> _deleteContact(Contact contact) async 
  {
    await widget.client.contact.deleteContact(contact);
  }

  // CONFIRMATION DIALOG FOR DELETING CONTACT
  void _askForDeleteConfirmation(Contact contact) async 
  {
    await showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        customTitle: "Delete Contact?",
        customContent: "Are you sure you want to delete this contact?",
        customActions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await _deleteContact(contact);
              if (!context.mounted) return;
              widget.updateHomeIndex(1);
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
  
  // ----------------------------------------------------------------------------//

    // ----------------------------------------------------------------------------//

}
