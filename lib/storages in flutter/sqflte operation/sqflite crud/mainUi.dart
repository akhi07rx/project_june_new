import 'package:flutter/material.dart';
import 'package:project_june1/storages%20in%20flutter/sqflte%20operation/sqflite%20crud/sqfliteoperations.dart';

void main(){
  runApp(MaterialApp(home: SqfliteHome(),));
}

class SqfliteHome extends StatefulWidget {
  @override
  State<SqfliteHome> createState() => _SqfliteHomeState();
}

class _SqfliteHomeState extends State<SqfliteHome> {
  var isLoading = true;

  //to read all the values from sqflite db
  List<Map<String, dynamic>> contacts = [];

  @override
  void initState() {
    loadUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyContacts"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(contacts[index]['cname']),
                subtitle: Text(contacts[index]['cnumber']),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        // creating a new data so the id will be null
        onPressed: () => showSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }

  final name_cntrl = TextEditingController();
  final phone_cntrl = TextEditingController();

  void showSheet(int? id) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: MediaQuery.of(context).
                viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phone_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Phone Number"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async{
                      if(id == null){
                        await createContact();
                      }
                      if(id != null){
                        // await updateContact(id);
                      }
                      name_cntrl.text="";
                      phone_cntrl.text="";
                      Navigator.pop(context);
                    },
                    child: Text(id == null ?
                    "Create Contact" : "Update Contact"))
              ],
            ),
          );
        });
  }
//to add a new data or contact to sqflite db
  Future<void> createContact() async {
    var id = await SQLHelper.create_contact(name_cntrl.text,phone_cntrl.text);
    print(id);
  }

  void loadUI() async{
    final data = await SQLHelper.readContacts();
    setState(() {
      contacts = data;
      isLoading = false;
    });
  }
}