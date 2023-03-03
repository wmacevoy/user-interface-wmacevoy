import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Form(
        child: Column(children: [
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(
                label: Text(
              'User name',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('User Info'),
                        content: Text(usernameController.value.text),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'))
                        ],
                      );
                    });
              },
              child: const Text('Submit'))
        ]),
      ),
    );
  }
}
