import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/contoller/todo_controller.dart';

class TodoUpdate extends StatefulWidget {
  const TodoUpdate({Key? key}) : super(key: key);

  @override
  State<TodoUpdate> createState() => _TodoUpdateState();
}

class _TodoUpdateState extends State<TodoUpdate> {
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // padding all text fields all constant varibles
    const commonPadding = EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 10,
    );
    const buttonText = "Update";
    const appBarTitle = "Update Todo";
    // end of local variables

    TodoController todoController = Get.find();

    todoTitleController.text = todoController.updateTodoVal['title'];
    todoDesController.text = todoController.updateTodoVal['desc'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: commonPadding,
            child: TextFormField(
              controller: todoTitleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Todo Title"),
              ),
            ),
          ),

          // message box
          Padding(
            padding: commonPadding,
            child: TextFormField(
              controller: todoDesController,
              minLines: 5,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Todo Description Here....",
              ),
            ),
          ),

          // save button
          Padding(
            padding: commonPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    todoController.updateTodo(
                      todoTitleController.text,
                      todoDesController.text,
                    );
                    Get.back();
                  },
                  child: Text(buttonText),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
