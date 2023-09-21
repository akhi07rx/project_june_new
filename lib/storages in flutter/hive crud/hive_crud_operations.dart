import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('to_do Box');
  runApp(MaterialApp(
    home: Hive_crud(),
  ));
}

class Hive_crud extends StatefulWidget {
  @override
  State<Hive_crud> createState() => _Hive_crudState();
}

class _Hive_crudState extends State<Hive_crud> {
  List<Map<String, dynamic>> task = [];
  final mybox = Hive.box('to_do Box');

  @override
  void initState() {
    load_or_read_Task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: task.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (ctx, index) {
                final mytask = task[index]; //fetch each single map from list
                return Card(
                  child: ListTile(
                    title: Text(task[index]['taskname']),
                    subtitle: Text(mytask['taskcont']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              showTask(context, mytask['id']);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deleteTask(mytask['id']);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showTask(context, null),
        label: const Text('Create Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  final task_controller = TextEditingController();
  final content_controller = TextEditingController();

  void showTask(BuildContext context, int? itemkey) {
    if (itemkey != null) {
      final existingTask =
          task.firstWhere((element) => element['id'] == itemkey);
      task_controller.text = existingTask['taskname'];
      content_controller.text = existingTask['taskcont'];
    }
    // itemkey issimilar to id in sqflite
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: task_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Task Name"),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: content_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Task Content"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (task_controller.text != "" &&
                          content_controller.text != "") {
                        if (itemkey == null) {
                          createTask({
                            'name': task_controller.text.trim(),
                            'content': content_controller.text.trim()
                          });
                        } else {
                          updateTaks(itemkey, {
                            'name': task_controller.text.trim(),
                            'content': content_controller.text.trim()
                          });
                        }
                      }
                      content_controller.text = "";
                      task_controller.text = "";
                      Navigator.of(context).pop();
                    },
                    child:
                        Text(itemkey == null ? 'Create Task' : 'Update Task'))
              ],
            ),
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    load_or_read_Task();
  }

  Future<void> updateTaks(int? itemkey, Map<String, String> uptask) async {
    await mybox.put(itemkey, uptask);
    load_or_read_Task(); // to refresh ui and update list
  }

  void load_or_read_Task() {
    final task_from_hive = mybox.keys.map((key) {
      //fetch all the keys from hive in ascending order
      final value =
          mybox.get(key); // all the values of each individual key from the box
      return {
        'id': key,
        'taskname': value['name'],
        'taskcont': value['content']
      };
    }).toList();

    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

  Future<void> deleteTask(int itemkey) async {
    await mybox.delete(itemkey);
    load_or_read_Task();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red, content: Text("Successfully Deleted")));
  }
}
