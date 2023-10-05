import 'package:flutter/material.dart';
import 'package:project_june1/firebase_example/email_pass_auth/firbase_db.dart';
import 'package:project_june1/firebase_example/email_pass_auth/login_fir.dart';

class Register_fire extends StatefulWidget {
  @override
  State<Register_fire> createState() => _Register_fireState();
}

class _Register_fireState extends State<Register_fire> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'UserName'),
              controller: username_controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'PassWord'),
              controller: password_controller,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String email = username_controller.text.trim();
                String pass = password_controller.text.trim();
                FirebaseHelper()
                    .register(useremail: email, password: pass)
                    .then((result) {
                  if (result == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login_fire()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: const Text('Register Here'))
        ],
      ),
    );
  }
}
