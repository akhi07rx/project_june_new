import 'package:flutter/material.dart';

class RegisterHive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final email = TextEditingController();
    final pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: pass,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Login')),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterHive()));
              },
              child: const Text('Not a user? Register Here!')),
        ],
      ),
    );
  }
}
