import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_june1/home.dart';

class LoginPage extends StatelessWidget {
  String uname = "admin";
  String pwd   = "abc123";
//text editing con
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: usercontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.people),
                    hintText: "UserName",
                    helperText: "user name must be an email",
                    labelText: "UserName"),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,
                  bottom: 50),
              child: TextField(
                controller: passcontroller,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.visibility_off_sharp),
                    hintText: "Password",
                    helperText: "password must contain 6 characters",
                    labelText: "Password"),
              ),
            ),
            ElevatedButton(onPressed: () {

              if(uname == usercontroller.text  && pwd == passcontroller.text) {

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage()));

                usercontroller.text= "";
                passcontroller.text="";
              } else{
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text("Invalid Username or Password"),
                //     backgroundColor: Colors.red,)
                // );
                Fluttertoast.showToast(
                    msg: "Invalid Username or Password",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                   // timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
