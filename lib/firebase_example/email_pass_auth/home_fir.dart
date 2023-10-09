import 'package:flutter/material.dart';
import 'package:project_june1/firebase_example/email_pass_auth/firbase_db.dart';
import 'package:project_june1/firebase_example/email_pass_auth/login_fir.dart';

class HomeFire extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseHelper().signOut().then((result) =>
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginFire())));
        }, child: Text("SignOut")),
      ),
    );
  }
}
