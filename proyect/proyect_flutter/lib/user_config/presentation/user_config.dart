import 'package:flutter/material.dart';
import 'package:proyect_client/proyect_client.dart';

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
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          onPressed: () {null;},
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
              controller: TextEditingController(text: 'widget.currentEmail'),
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