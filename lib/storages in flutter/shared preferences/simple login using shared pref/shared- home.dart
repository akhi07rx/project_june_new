import 'package:flutter/material.dart';
import 'package:project_june1/storages%20in%20flutter/shared%20preferences/simple%20login%20using%20shared%20pref/shared-login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHome extends StatefulWidget {
  const SharedHome({super.key});

  @override
  State<SharedHome> createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  late SharedPreferences preferences;
  late String username;

  @override
  void initState() {
    fetchData(); // when the second page loads this method will execute
    super.initState();
  }

  void fetchData() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences
          .getString('uname')!; // fetch the value from shared preferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("WELCOME $username"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  preferences.setBool('newuser', true);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginShared()));
                },
                child: Text('LOGOUT'))
          ],
        ),
      ),
    );
  }
}
