import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final MaterialStateProperty<Color?>? backGroundColor;
  const DialogButton({ Key? key , 
    required this.onPressed,
    this.backGroundColor,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: backGroundColor ?? MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}