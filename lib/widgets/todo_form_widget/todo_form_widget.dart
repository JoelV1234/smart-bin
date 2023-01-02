import 'package:flutter/material.dart';
import 'package:smartbin/widgets/form/form_components.dart';

class TodoFormWidget extends StatelessWidget {
  final TextEditingController todoTitleInput;
  final TextEditingController todoDescriptionInput;
  final List<Widget> additional;
  final void Function() onSavedTodo;

  const TodoFormWidget({
    Key? key,
    required this.todoTitleInput,
    required this.todoDescriptionInput,
    required this.onSavedTodo,
    this.additional = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(todoTitleInput: todoTitleInput),
            const SizedBox(height: 8),
            buildDescription(todoDescriptionInput: todoDescriptionInput),
            const SizedBox(height: 32),
            buildButton(onSavedTodo: onSavedTodo),
          ] + additional,
        ),
      );
}
