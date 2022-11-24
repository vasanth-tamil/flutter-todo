import 'package:flutter/material.dart';
import 'package:todo/pages/todo_add.dart';
import 'package:todo/pages/todo_views.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const GetMaterialApp(
      home: TodoView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
