import 'package:flutter/material.dart';





class Todo extends StatefulWidget {
 
 const Todo({Key? key}) : super(key: key);
  @override
  State<Todo> createState() => _TodoState();



}

//todostate contains all the logic and list for the app
class _TodoState extends State<Todo> {
  List<String> _todoItems = [];

  //addtodoitem called each time the button is pressed
  void _addTodoItem() {
    // Putting our code inside "setState" tells the app that our state has changed, and
    // it will automatically re-render the list
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item ' + index.toString());
    });
  }
    // Build the whole list of todo items
  // Widget _buildTodoList() {
  //   return new ListView.builder(
  //     itemBuilder: (context, index) {
  //       // itemBuilder will be automatically be called as many times as it takes for the
  //       // list to fill up its available space, which is most likely more than the
  //       // number of todo items we have. So, we need to check the index is OK.
  //       if(index < _todoItems.length) {
  //         return _buildTodoItem(_todoItems[index]);
  //       }
  //     },
  //   );
  // }

    // Build a single todo item
  Widget _buildTodoItem(String todoText) {
    return new ListTile(
      title: new Text(todoText)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('To-do list'),
        ),
        //Floating action button
        body: const Center(child: Text('Press the button below!')),
        floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
        ),

      ),
    );
  }
}

  









