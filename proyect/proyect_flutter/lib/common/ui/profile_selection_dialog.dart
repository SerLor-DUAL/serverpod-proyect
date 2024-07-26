import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

class ProfilePictureSelector extends StatefulWidget {
  final String title;
  final List<String> profilePictures; // List of asset paths
  final ValueChanged<String> onProfilePictureSelected;
  final Client client;
  final Contact contact;

  const ProfilePictureSelector({
    super.key,
    required this.title,
    required this.profilePictures,
    required this.onProfilePictureSelected,
    required this.client,
    required this.contact
  });

  @override
  _ProfilePictureSelectorState createState() => _ProfilePictureSelectorState();
}

class _ProfilePictureSelectorState extends State<ProfilePictureSelector> {
  String? _selectedProfilePicture;

  Future<void> updatePicture(String selectedPicture) async{
    Contact contact = widget.contact;
    contact.profileIMG = selectedPicture;
    await widget.client.contact.updateContact(contact);
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
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: Text(
                widget.title,
                style: const TextStyle(
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
                itemCount: widget.profilePictures.length,
                itemBuilder: (context, index) {
                  final assetPath = widget.profilePictures[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedProfilePicture = assetPath;
                      });
                      widget.onProfilePictureSelected(assetPath);
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
                      if (_selectedProfilePicture != null && _selectedProfilePicture != widget.contact.profileIMG){
                        await updatePicture(_selectedProfilePicture!);
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