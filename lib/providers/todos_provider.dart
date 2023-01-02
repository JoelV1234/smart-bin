import 'package:flutter/material.dart';
import 'package:smartbin/models/todo.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
      id: '56dbd9d8-925e-406b-9b82-169c751d0c0e',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
      id: '288a6127-7985-4c44-ae51-c1de1aca4f6d',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Dog 🐕',
      id: 'ed68952e-82cf-4f97-9f0c-c651b275b1a8',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan Jacobs birthday party 🎉🥳',
      id: '76e5f3b5-2a2c-451f-a27a-3565c225ddb6',
    ),
  ];

  void addTodo(Todo todo) {
    _todos.add(todo);
    updateList();
  }

  void toggleTodo(Todo todo) {
    todo.isDone = !todo.isDone;
    updateList();
  }

  void updateList() => notifyListeners();

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    updateList();
  }

  List<Todo> todos(isCompleted) => _todos.where((todo) => todo.isDone == isCompleted).toList();

}
