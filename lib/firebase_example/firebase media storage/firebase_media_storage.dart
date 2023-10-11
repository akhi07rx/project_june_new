import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA4EXa4My5mFXw2SeGac3k28Np8fW9rTgc",
        projectId: "project-june-398208",
        appId: '1:449474307463:android:c7edd9a6607ad1240edf22',
        messagingSenderId: '',
        storageBucket: "project-june-398208.appspot.com"),
  );
  runApp(MaterialApp(
    home: FireMediaStorage(),
  ));
}

class FireMediaStorage extends StatefulWidget {
  const FireMediaStorage({super.key});

  @override
  State<FireMediaStorage> createState() => _FireMediaStorageState();
}

class _FireMediaStorageState extends State<FireMediaStorage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireBase Storage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('camera'),
                    icon: Icon(Icons.camera_alt_rounded),
                    label: Text('Camera')),
                ElevatedButton.icon(
                    onPressed: () => upload('gallery'),
                    icon: Icon(Icons.photo_album),
                    label: Text('Gallery')),
              ],
            ),
            Expanded(
                child: FutureBuilder(
              // If firebase connection is success load data or media from firebase
              future: LoadMedia(),
              builder: (context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(image['url']),
                            title: Text(image['uploadedby']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                                onPressed: () => deleteMedia(image['path']),
                                icon: Icon(Icons.delete)),
                          ),
                        );
                      });
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Future<void> upload(String imageSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;

    try {
      pickedImage = await picker.pickImage(
          source: imageSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      final String filename = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path);
      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'Uploaded by': 'Its me XXXX',
              'Description': 'Some description'
            }));
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<List<Map<String, dynamic>>> LoadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (singlefile) async {
      final String fileurl = await singlefile
          .getDownloadURL(); // to fetch image path (path as network image path)
      final FullMetadata metadata =
          await singlefile.getMetadata(); // to fetch metadata from firebase

      images.add({
        'imageurl': fileurl,
        'path': singlefile.fullPath,
        'uploaded by': metadata.customMetadata?['uploadedby'] ?? 'No Data',
        'description':
            metadata.customMetadata?['description'] ?? 'No Description'
      });
    });
    return images;
  }

  deleteMedia(image) {}
}
