import 'package:flutter/material.dart';
import 'package:project_june1/storages%20in%20flutter/sqflite%20example/sqlhelper.dart';
import 'LoginUi.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var formkey2 = GlobalKey<FormState>();
  var uname = TextEditingController();
  var uemail = TextEditingController();
  var pass = TextEditingController();
  var cpass = TextEditingController();

  bool passvisibility1 = true;
  bool passvisibility2 = true;

  void newuser(String name, String email, String password) async {
    var id = await SQLHelper.newuser(name, email, password);
    if (id != null) {
      Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => Login()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Not Success')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey2,
          child: Column(children: [
            SizedBox(height: 70,),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100, top: 100),
              child: Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                "Create an Account, It's free",
                style: TextStyle(fontSize: 10),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: uname,
                validator: (email) {
                  if (email!.isEmpty) {
                    return "Name is required";
                  } else
                    return null;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: uemail,
                validator: (username) {
                  if (username!.isEmpty ||
                      !username.contains("@") ||
                      !username.contains(".")) {
                    return "Fields are empty or Invalid";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Email ID",
                    prefixIcon: Icon(Icons.contact_mail_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (pass1) {
                  if (pass1!.isEmpty || pass1.length < 6) {
                    return "Fields are empty or Password length must be greaterthan 6";
                  } else {
                    return null;
                  }
                },
                controller: pass,
                obscuringCharacter: "*",
                obscureText: passvisibility1,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
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
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (pass2) {
                  if (pass2!.isEmpty || pass2.length < 6) {
                    return "Password length must be greater than 6";
                  } else if (pass.text != cpass.text) {
                    return "Password not matching";
                  } else {
                    return null;
                  }
                },
                controller: cpass,
                obscuringCharacter: "*",
                obscureText: passvisibility2,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
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
                    hintText: "Conform Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),

              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(330, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                onPressed: () async {
                  final valid2 = formkey2.currentState!.validate();
                  if (valid2) {
                    var data = await SQLHelper.userFound(uname.text, uemail.text);
                    if (data.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User already exist')));
                    } else {
                      newuser(uname.text, uemail.text, pass.text);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        action: SnackBarAction(label: 'UNDO', onPressed: () {}),
                        content: const Text('Invalid username / password')));
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text("Alredy have an account? Login!!")),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
