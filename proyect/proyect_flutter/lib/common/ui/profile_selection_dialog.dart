import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/custom_alert_dialog.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';


class ProfilePictureSelector extends StatefulWidget {

  final Client client;
  final Contact? contact;
  final UserInfo? userInfo;

  const ProfilePictureSelector({
    super.key,
    required this.client,
    this.contact,
    this.userInfo,
  });

  @override
 createState() => _ProfilePictureSelectorState();
}

class _ProfilePictureSelectorState extends State<ProfilePictureSelector> {
  String? _selectedProfilePicture;
  final List<String> profilePictures = [
      'assets/img/profiles/profile1.jpg',
      'assets/img/profiles/profile2.jpg',
      'assets/img/profiles/profile3.jpg'
    ]; // List of asset paths


    Future<void> updatePictureUser(String selectedPicture) async{
      if (widget.userInfo != null){
        try{
          widget.userInfo!.imageUrl = selectedPicture;
          await widget.client.usersRegistry.updateUserInfo(widget.userInfo!);
        }
        catch(e){
          CustomAlertDialog(
            customTitle: 'Error Ocurred',
            customContent: e.toString(),
          );
        }
      }
      if (mounted){
        Navigator.pop(context);
      }
    }

  Future<void> updatePictureContact(String selectedPicture) async{
    Contact? contact = widget.contact;
    contact?.profileIMG = selectedPicture;
    try {
      await widget.client.contact.updateContact(contact);
    }
    catch (e){
      CustomAlertDialog(
        customTitle: 'Error Ocurred',
        customContent: e.toString(),
      );
    }
    if (mounted){
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color(0xFF369DD8),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: Text(
                'Select a picture:',
                style: TextStyle(
                  color: Color(0xFF369DD8),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const Divider(
              color: Color(0xFF369DD8),
              indent: 30,
              endIndent: 30,
            ),
            if (_selectedProfilePicture != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  _selectedProfilePicture!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: profilePictures.length,
                itemBuilder: (context, index) {
                  final assetPath = profilePictures[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedProfilePicture = assetPath;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF369DD8),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          assetPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 15,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      if (widget.userInfo != null) {
                        if (_selectedProfilePicture != null){
                          await updatePictureUser(_selectedProfilePicture!);
                        }
                      }
                      if (widget.contact != null){
                        if (_selectedProfilePicture != null && _selectedProfilePicture != widget.contact?.profileIMG){
                          await updatePictureContact(_selectedProfilePicture!);
                        }
                      }
                    },
                    
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18.0),
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.00),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 54, 157, 216),
                      shadowColor: const Color.fromARGB(255, 54, 157, 216),
                      elevation: 3,
                      shape: ContinuousRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Edit Image'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 18.0),
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.00),
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 54, 157, 216),
                      shadowColor: const Color.fromARGB(255, 54, 157, 216),
                      elevation: 3,
                      shape: ContinuousRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 54, 157, 216),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}