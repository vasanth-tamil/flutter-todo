import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/pages/todo_add.dart';
import 'package:todo/pages/todo_update.dart';

import '../contoller/todo_controller.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  // get getx class
  TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    var todoDatas = todoController.todoData;
    return Scaffold(
      body: Container(
        child: GetBuilder<TodoController>(builder: (todo) {
          return ListView.builder(
            itemCount: todo.todoData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todo.todoData[index]['title']),
                subtitle: Text(todo.todoData[index]['desc']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoController.deleteTodo(index);
                  },
                ),
                onTap: () {
                  todoController.updateIndex(index);
                  Get.to(() => const TodoUpdate());
                },
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const TodoAdd());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
