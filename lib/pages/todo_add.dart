import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/contoller/todo_controller.dart';

class TodoAdd extends StatefulWidget {
  const TodoAdd({Key? key}) : super(key: key);

  @override
  State<TodoAdd> createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDesController = TextEditingController();

  // get getx
  TodoController todoController = Get.find();
  // end

  @override
  Widget build(BuildContext context) {
    // padding all text fields all constant varibles
    const commonPadding = EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 10,
    );
    const buttonText = "Save";
    const appBarTitle = "New Todo";
    // end of local variables

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
                    var title = todoTitleController.text;
                    var desc = todoDesController.text;
                    todoController.addTodo(title, desc);
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
