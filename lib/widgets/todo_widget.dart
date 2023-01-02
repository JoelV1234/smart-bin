import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/models/todo.dart';
import 'package:smartbin/providers/todos_provider.dart';
import 'package:smartbin/utils.dart';
import 'package:smartbin/widgets/edit_todo_dialog_widget.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  late TodosProvider todosProvider;

  @override
  void initState() {
    todosProvider = Provider.of<TodosProvider>(context, listen: false);
    super.initState();
  }

  void deleteTodo(BuildContext context, Todo todo) {
    todosProvider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');
  }

  void toggleTodo() => todosProvider.toggleTodo(widget.todo); 

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: buildTodo(context),
      );
  }

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: widget.todo.isDone,
              onChanged: (state) => toggleTodo(),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.todo.title,
                    style: TextStyle(
                      decoration: widget.todo.isDone ?
                        TextDecoration.lineThrough : null,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (widget.todo.description.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        widget.todo.description,
                        style: TextStyle(
                          fontSize: 20, height: 1.5,
                          decoration: widget.todo.isDone ?
                            TextDecoration.lineThrough : null,                  
                        ),
                      ),
                    )
                ],
              ),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => EditTodoDialogWidget(todo: widget.todo),
                barrierDismissible: false,
              ),              
              icon: const Icon(Icons.more_horiz)
            ),    
          ],
        ),
      );
}
