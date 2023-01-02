
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartbin/models/todo.dart';
import 'package:smartbin/providers/todos_provider.dart';
import 'package:smartbin/widgets/dialog_close_button.dart';
import 'package:smartbin/widgets/todo_form_widget/todo_form_widget.dart';
import 'package:uuid/uuid.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({super.key});

  @override
  AddTodoDialogWidgetState createState() => AddTodoDialogWidgetState();
}

class AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController todoTitleInput= TextEditingController();
  final TextEditingController todoDescriptionInput = TextEditingController();

  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    
    if (!isValid) {
      return;
    } else {
      Todo todo = Todo(
        id: const Uuid().v4(),
        title: todoTitleInput.text,
        description: todoDescriptionInput.text,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const DialogCloseButton(title: 'Add Todo'),
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