// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:project_june1/storages%20in%20flutter/hive%20using%20hive%20adapter/database/hivedb.dart';
// import 'package:project_june1/storages%20in%20flutter/hive%20using%20hive%20adapter/models/user_model.dart';
// import 'package:project_june1/storages%20in%20flutter/hive%20using%20hive%20adapter/screens/RegistrationPAge.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   //Hive.registerAdapter();
//   await Hive.openBox<User>('UserData');
//   runApp(GetMaterialApp(
//     home: Login(),
//   ));
// }
//
// class Login extends StatelessWidget {
//   final email = TextEditingController();
//   final pass = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               controller: email,
//               decoration: const InputDecoration(hintText: 'Email'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: TextField(
//               controller: pass,
//               decoration: const InputDecoration(hintText: 'Password'),
//             ),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 final users = await HiveDb.instance.getUser();
//                 checkUserExist(context, users);
//               },
//               child: const Text('Login')),
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => RegisterHive()));
//               },
//               child: const Text('Not a user? Register Here!')),
//         ],
//       ),
//     );
//   }
//
//   Future<void> checkUserExist(BuildContext context, List<User> users) async {
//     final lemail = email.text.trim();
//     final lpass = pass.text.trim();
//     bool userFound = false;
//     if (lemail != "" && lpass != "") {
//       await Future.forEach(users, (singleUser) {
//         if (lemail == singleUser.email && lpass == singleUser.pass) {
//           userFound = true;
//         } else {
//           userFound = false;
//         }
//       });
//       if (userFound == true) {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => HiveHome(email: lemail)));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Login Failed, user not found')));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Field Must Not be Empty')));
//     }
//   }
// }
