import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  List<String> todoList = ['Task 1', 'Task 2', 'Task 3'];
  void showAddDialog(){
    final key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add task', style: TextStyle(fontSize: 25)),
            content: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controller,
                    validator: (value){
                      if(value == null || value.isEmpty) {
                          return 'Please enter a task';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(key.currentState!.validate()) {
                          setState(() {
                            todoList.add(controller.text);
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add')
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void showEditDialog(String task, int index){
    final key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController(text: task);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit task', style: TextStyle(fontSize: 25)),
            content: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: controller,
                    validator: (value){
                      if(value == null || value.isEmpty) {
                        return 'Please enter a task';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(key.currentState!.validate()) {
                          setState(() {
                            todoList[index] = controller.text;
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Edit')
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void showDeleteDialog(int index){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm delete', style: TextStyle(fontSize: 25)),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Are you sure want to delete?'),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          todoList.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('Delete')
                  )
                ],
              ),

          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: (){showAddDialog();}, icon: const Icon(Icons.add, size: 30))
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(todoList[index]),
                leading: Text('${index+1}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){showEditDialog(todoList[index], index);},
                        icon: const Icon(Icons.edit_outlined, color: Colors.blue)
                    ),
                    IconButton(
                        onPressed: (){showDeleteDialog(index);},
                        icon: const Icon(Icons.delete_outline, color: Colors.red)
                    ),

                  ],
                ),

              );
            }
        ),
      ),
    );
  }
}
