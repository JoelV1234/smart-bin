import 'package:flutter/material.dart';

class DialogCloseButton extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  const DialogCloseButton(
      {Key? key, required this.title, this.actions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(-9, 0),
          child: IconButton(
            splashRadius: 20,
            onPressed: () => Navigator.pop(context), 
            icon: const Icon(Icons.close)
          ),
        ),
        const Text(
          'Add Todo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Expanded(child: Container()),
      ] + actions,
    );
  }
}
