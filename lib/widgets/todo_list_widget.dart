import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/providers/todos_provider.dart';
import 'package:smartbin/widgets/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  final bool completedScreen;
  const TodoListWidget({super.key,
    required this.completedScreen
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos(completedScreen);

    return todos.isEmpty
        ?  Center(
            child:  Text(
              completedScreen ? 'No completed todos.' : 'No todos',
              style: const TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
