  import 'package:flutter/material.dart';
import 'package:smartbin/widgets/dialog_button.dart';

Widget buildTitle({
  required TextEditingController todoTitleInput
}) => TextFormField(
        maxLines: 1,
        initialValue: todoTitleInput.text,
        controller: todoTitleInput,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription({
  required TextEditingController todoDescriptionInput
}) => TextFormField(
        maxLines: 3,
        initialValue: todoDescriptionInput.text,
        controller: todoDescriptionInput,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton({
    required void Function() onSavedTodo
  }) => DialogButton(
    onPressed: onSavedTodo,
    child: const Text('Save'),
  );