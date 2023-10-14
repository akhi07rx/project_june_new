import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends StatefulWidget {
  const PermissionHandler({super.key});

  @override
  State<PermissionHandler> createState() => _PermissionHandlerState();
}

class _PermissionHandlerState extends State<PermissionHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Handler'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: requestCameraPermission,
                child: const Text(
                  'Request Camera permission',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: requestMultiplePermission,
                child: const Text(
                  'Request Multiple Access permission',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: requestPermissiontoOpenSettings,
                child: Text(
                  'Request permission to open settings',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      ImagePicker picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
      print('permission is granted');
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Permission Denied')));
      if (await Permission.camera.request().isGranted) {
        print('permission is granted');
      }
    }
  }

  void requestMultiplePermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.photos
    ].request();
    print('location permission: ${statuses[Permission.location]}'
        'Storage permission: ${statuses[Permission.storage]}'
        'Photos Permission: ${statuses[Permission.photos]}');
  }

  void requestPermissiontoOpenSettings() async {
    openAppSettings();
  }
}

void main() {
  runApp(MaterialApp(
    home: PermissionHandler(),
  ));
}
