import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/profile_selection_dialog.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class UserProfileConfig extends StatefulWidget {
  final Client client;
  final UsersRegistry user;

  const UserProfileConfig({
    super.key,
    required this.client,
    required this.user
  });
  

  @override
  _UserProfileConfigState createState() => _UserProfileConfigState();
}

class _UserProfileConfigState extends State<UserProfileConfig> {
  

  UserInfo? _userInfo;

  void _fetchUserInfo()async{
    _userInfo = await widget.client.usersRegistry.getUserInfoById(widget.user.id!);
  }

  Future<void> updateUserPicture() async{
    await showDialog(
            context: context,
            builder: (context) {
              return ProfilePictureSelector(
                user: widget.user,
                client: widget.client,
              );
            }
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Add your image picker logic here
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: null,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundImage: (widget.user.userInfo?.imageUrl != null)
                                        ? AssetImage(widget.user.userInfo!.imageUrl!)
                                        : null,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          onPressed: () async{
                            await updateUserPicture();
                            setState(() {
                              
                            });
                          },
                          icon: const Icon(
                                  Icons.camera_alt,
                                  size: 17,
                                  color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: widget.user.userName),
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: (widget.user.userInfo != null && widget.user.userInfo?.email != null)
                                                      ? widget.user.userInfo?.email :
                                                        ''  ),
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your save logic here
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}