import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_june1/stateful%20login%20with%20validation.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formkey = GlobalKey<FormState>();
  bool passvisibility1 = true;
  bool passvisibility2 = true;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Image.asset(
              "assets/icons/butterfly.png",
              height: 100,
              width: 100,
            ),
            const Text(
              "Registration Page",
              style: TextStyle(fontSize: 30, color: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (uname) {
                  if (uname!.isEmpty || !uname.contains('@')) {
                    return "Fields are empty or invalid";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
              child: TextFormField(
                obscuringCharacter: '*',
                obscureText: passvisibility1, // showpass = true initialy
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passvisibility1 == true) {
                              passvisibility1 = false;
                            } else {
                              passvisibility1 = true;
                            }
                          });
                        },
                        icon: Icon(passvisibility1 == true
                            ? Icons.visibility_off_sharp
                            : Icons.visibility)),
                    hintText: "PassWord",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (pass) {
                  password = pass; // value from first password field will stored to password
                  if (pass!.isEmpty || pass.length < 6) {
                    return "Fields are empty or password length must be >=6";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
              child: TextFormField(
                obscuringCharacter: '*',
                obscureText: passvisibility2, // showpass = true initialy
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passvisibility2 == true) {
                              passvisibility2 = false;
                            } else {
                              passvisibility2 = true;
                            }
                          });
                        },
                        icon: Icon(passvisibility2 == true
                            ? Icons.visibility_off_sharp
                            : Icons.visibility)),
                    hintText: "PassWord",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (cpass) {
                  if (cpass!.isEmpty || cpass != password) {
                    return "Fields are empty or password does not match";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Login2()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Invalid Username or Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        // timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
