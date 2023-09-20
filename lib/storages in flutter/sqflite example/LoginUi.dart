import 'package:flutter/material.dart';
import 'package:project_june1/storages%20in%20flutter/sqflite%20example/sqlhelper.dart';
import 'AdminHomeUI.dart';
import 'HompageUI.dart';
import 'SignupUI.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  bool passwordvisibility = true;

  final TextEditingController uemail = TextEditingController();
  final TextEditingController cpass = TextEditingController();

  void logincheck(String email, String password) async {
    if (email == 'admin@gmail.com' && password == '123456') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminHome()));
    } else {
      var data = await SQLHelper.logincheck(email, password);
      if (data.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                      data: data,
                    )));
        print(data);
      } else if (data.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Signup()));
        print("Not a User!...Login Failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formkey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 100),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "Welcome back! Login with your credentials",
                style: TextStyle(fontSize: 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: uemail,
                decoration: InputDecoration(
                    hintText: "Email ID",
                    prefixIcon: Icon(Icons.contact_mail_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (username) {
                  if (username!.isEmpty ||
                      !username.contains("@") ||
                      !username.contains(".")) {
                    return "Fields are empty or Invalid";
                  }
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                child: TextFormField(
                  controller: cpass,
                  obscureText: passwordvisibility,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passwordvisibility == true) {
                                passwordvisibility = false;
                              } else {
                                passwordvisibility = true;
                              }
                            });
                          },
                          icon: Icon(passwordvisibility == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password"),
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return "Password length should be greater than 6";
                    }
                  },
                  textInputAction: TextInputAction.next,
                )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MaterialButton(
                color: Colors.pink,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    logincheck(uemail.text, cpass.text);
                  } else {}
                },
                child: const Text("LOGIN"),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text("New User ? Sign Up")),
          ],
        ),
      ),
    ));
  }
}
