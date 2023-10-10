import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class FirebaseMediaStorage extends StatefulWidget {


  @override
  State<FirebaseMediaStorage> createState() => _FirebaseMediaStorage

  State();
}

class _FirebaseMediaStorage
State extends State<FirebaseMediaStorage> {

FirebaseStorage storage = FirebaseStorage.instance;

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Storage Media"),),
    body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [Row(
          children: [
            ElevatedButton.icon(
                onPressed: () => upload('camera'),
                icon: (Icons.camera_alt_outlined),
                label: Text("Camera")),
            ElevatedButton.icon(
                onPressed: () => upload('camera'),
                icon: (Icons.photo),
                label: Text("Gallery")),
          ],
        )
        ],
      ),
    ),
  );
}

Future<void> upload(String imageSource) async {
  final picker = ImagePicker();
  XFile? pickedImage;

  try {
    pickedImage = await picker.pickImage(source: imageSource == 'camera' ?
    ImageSource.camera : ImageSource.gallery, maxWidth: 1920
    );
    final String filename = path.basename(pickedImage!.path);
    File imagefile = File(pickedImage.path)

    try {
      await storage.ref(fileName).putFile(
          imagefile, SettableMetadata(customMetadata: {
        'UploadedBy': "Its ME XXXX",
        'Description': "Some Description"
      })
      );
      setState(() {});
    }
    on FirebaseException catch (error) {
      print(error)
    }
  }
}}
