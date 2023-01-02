// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo extends Equatable{
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });
  
  @override
  List<Object> get props => [id];
}