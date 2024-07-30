import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';
import 'package:proyect_flutter/common/ui/profile_selection_dialog.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
part '../domain/user_config_controller.dart';

class UserProfileConfig extends StatefulWidget {
  final Client client;
  final UsersRegistry user;
  final UserInfo userInfo;

  const UserProfileConfig({
    super.key,
    required this.client,
    required this.user,
    required this.userInfo
  });
  
  @override
  createState() => _UserProfileConfig();
}

class _UserProfileConfig extends UserProfileConfigController{
  
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
              
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: (widget.userInfo.imageUrl != null)
                                        ? AssetImage(widget.userInfo.imageUrl!)
                                        : null,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 17,
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
              controller: TextEditingController(text: widget.userInfo.userName?? widget.user.userName),
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: widget.userInfo.fullName?? ''),
              decoration: const InputDecoration(
                labelText: 'Full Name',
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
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}