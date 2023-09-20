import 'package:flutter/material.dart';
import 'package:project_june1/storages%20in%20flutter/sqflite%20example/sqlhelper.dart';

class AdminHome extends StatefulWidget {
  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    Refresh();
    super.initState();
  }

  void Refresh() async {
    var mydata = await SQLHelper.getAll();
    setState(() {
      data = mydata;
    });
  }

  void delete(int id) async {
    await SQLHelper.Deleteuser(id);
    Refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Card(
              color: Colors.green[200],
              child: ListTile(
                title: Text('${data[index]['name']}'),
                subtitle: Text('${data[index]['email']}'),
                trailing: Wrap(children: [
                  IconButton(
                    onPressed: () {
                      delete(data[index]['id']);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
