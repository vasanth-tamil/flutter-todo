import 'package:get/get.dart';

class TodoController extends GetxController {
  final _todoDatas = [];
  var _updateIndex = -1;

  void addTodo(String title, String description) {
    var datas = {
      "title": title,
      "desc": description,
    };
    _todoDatas.add(datas);
    update();
  }

  void updateIndex(int index) {
    _updateIndex = index;
    print(_updateIndex);
  }

  dynamic get updateTodoVal => _todoDatas[_updateIndex];

  void updateTodo(String title, String description) {
    if (_updateIndex != -1) {
      _todoDatas[_updateIndex]['title'] = title;
      _todoDatas[_updateIndex]['desc'] = description;
      update();
    }
    print(_updateIndex);
  }

  void deleteTodo(int index) {
    _todoDatas.removeAt(index);
    update();
  }

  dynamic get todoData => _todoDatas;
}
