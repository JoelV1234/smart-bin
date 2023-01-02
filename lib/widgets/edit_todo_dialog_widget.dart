import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/models/todo.dart';
import 'package:smartbin/providers/todos_provider.dart';
import 'package:smartbin/utils.dart';
import 'package:smartbin/widgets/dialog_button.dart';
import 'package:smartbin/widgets/dialog_close_button.dart';
import 'package:smartbin/widgets/todo_form_widget/todo_form_widget.dart';

class EditTodoDialogWidget extends StatefulWidget {
  final Todo todo;
  const EditTodoDialogWidget({Key? key, required this.todo}) : super(key: key);

  @override
  EditTodoDialogWidgetState createState() => EditTodoDialogWidgetState();
}

class EditTodoDialogWidgetState extends State<EditTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController todoTitleInput = TextEditingController();
  final TextEditingController todoDescriptionInput = TextEditingController();
  late TodosProvider provider;

  @override
  void initState() {
    todoTitleInput.text = widget.todo.title;
    todoDescriptionInput.text = widget.todo.description;
    provider = Provider.of<TodosProvider>(context, listen: false);
    super.initState();
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      widget.todo.title = todoTitleInput.text;
      widget.todo.description = todoDescriptionInput.text;
      widget.todo.createdTime = DateTime.now();
      provider.updateList();
      Navigator.of(context).pop();
    }
  }

  void deleteTodo() {
    provider.removeTodo(widget.todo);
    Navigator.of(context).pop();
    Utils.showSnackBar(context, 'Deleted this todo');
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DialogCloseButton(
                title: 'Add Todo',
                actions: [
                  IconButton(onPressed: deleteTodo, icon: const Icon(Icons.delete))
                ],
              ),
              const SizedBox(height: 8),
              TodoFormWidget(
                todoDescriptionInput: todoDescriptionInput,
                todoTitleInput: todoTitleInput,
                onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      );
}
