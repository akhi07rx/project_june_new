import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_june1/storages%20in%20flutter/hive%20using%20hive%20adapter/database/models/user_model.dart';
import 'package:project_june1/storages%20in%20flutter/hive%20using%20hive%20adapter/screens/RegistrationPAge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Hive.registerAdapter();
  await Hive.openBox<User>('UserData');
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final pass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
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
