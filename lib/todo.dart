import 'package:flutter/material.dart';





class Todo extends StatefulWidget {
 
 const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('To-do list'),
        ),

      ),
    );
  }
}











