import 'package:cool_app/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello world')),
      body: Column(children: [
        Text(
          'This is the home page',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ElevatedButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UserProfile())),
            child: Text(
              'User profile',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white),
            ))
      ]),
    );
  }
}
