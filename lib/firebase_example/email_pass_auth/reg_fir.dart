import 'package:flutter/material.dart';
import 'package:project_june1/firebase_example/email_pass_auth/firbase_db.dart';
import 'package:project_june1/firebase_example/email_pass_auth/login_fir.dart';


class Register_fire extends StatefulWidget {

  @override
  State<Register_fire> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<Register_fire> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "UserName"),
              controller: email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Password"),
              controller: pass,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String mail = email.text.trim();
                String pwd = pass.text.trim();

                FirebaseHelper().signUp(email: mail, password: pwd).then((result) {
                  if (result == null) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginFire()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: Text('Register'))
        ],
      ),
    );
  }
}
