import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('to_do_box');
  runApp(MaterialApp(
    home: Hive_crud(),
  ));
}

class Hive_crud extends StatefulWidget {
  const Hive_crud({super.key});

  @override
  State<Hive_crud> createState() => _Hive_crudState();
}
class _Hive_crudState extends State<Hive_crud> {
  List<Map<String, dynamic>> task = [];
  final mybox= Hive.box('to_do_box');

  @override
  void initState() {
    Load_or_Read_Task();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      body: task.isEmpty ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: task.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                title: Text(task[index]['taskname']),
                subtitle: Text(task[index]['taskcont']),
                trailing: Wrap(
                  children: [
                    IconButton(onPressed: () {
                      showTask(context, task['id']);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () => showTask(context, null),
        label: const Text('Create Task'),
        icon: const Icon(Icons.add),
      ),
    );
  }
  final task_controller =TextEditingController();
  final content_controller=TextEditingController();

  void showTask(BuildContext context, int? itemkey) {
    if (itemkey != null) {
      final existingTask = task.firstWhere((element) =>
      element['id'] == itemkey);
      task_controller.text = existingTask['taskname'];
      content_controller.text = existingTask['taskcont'];
    }

    showTask(BuildContext context, int? itemkey) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom + 120
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: task_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Task Name"
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: content_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Task Content'
                  ),
                ),
                ElevatedButton(onPressed: () {
                  if (task_controller.text != "" &&
                      content_controller.text != "") {
                    if (itemkey == null) {
                      createTask({
                        'name': task_controller.text.trim(),
                        'content': content_controller.text.trim()
                      });
                    } else {
                      updateTask(itemkey, {
                        'name': task_controller.text.trim(),
                        'content': content_controller.text.trim()
                      });
                    }
                  }
                  content_controller.text = "";
                  task_controller.text = "";
                },
                    child: Text(
                        itemkey == null ? 'Create  Task' : "Update Task"))
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    Load_or_Read_Task();
  }

  void updateTask(int? itemkey, Map<String, String> map) async{}

  void Load_or_Read_Task() {
    final task_from_hive = mybox.keys.map((key) {
      final value = mybox.get(key);
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
}