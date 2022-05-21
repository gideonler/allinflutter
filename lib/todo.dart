import 'package:flutter/material.dart';

class Todo {
  //Class that defines todo element, telling flutter what a todo has.
  // In this case it has a name and check state (bool)
  final String name;
  bool checked;
  Todo({required this.name, required this.checked});

}


//Todoitem single representation for each todo item in our list
class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;


//Textstyle, boolean to evaluate whether a todo is checked or not. If not checked, return nothing, else 
//returns a single line through text
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name, style: _getTextStyle(todo.checked)),
    );
  }
}



class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);
  @override
  _TodoListState createState() => new _TodoListState();
//widget calls a state to evaluate what needs to happen and render. In our case, we call the _TodoState.
//This will have all the list and logic for our app.

}

//todostate contains all the logic and list for the app
class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];




//DISPLAY DIALOG TO ADD NEW TODOS -- (from here)
//setstate invoke state change for addtodoitem, add new todo list to todods
  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

//FAB invoke function _displaydialog when click, to open dialog with text area and as return, create new todo
//based on value of texture
  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
//(to here)

//Crossing todo items off the list
void _handleTodoChange(Todo todo) {
	setState(() {
	  todo.checked = !todo.checked;
	});
}


  @override
  Widget build(BuildContext context) {
    //Widget template here
  return new Scaffold(
    appBar: new AppBar(
      title: new Text('Todo List'),
    ),
    body: ListView(
      //padding and edgeinsect to describe the margins
      padding: EdgeInsets.symmetric(vertical:8.0),
      children: _todos.map((Todo todo){


        //return todoitem for each element, pass todo and change handler to this widget
        return TodoItem(
          todo: todo,
          onTodoChanged: _handleTodoChange,
          
        );
      }).toList(),
    ),

    floatingActionButton: FloatingActionButton(
	      onPressed: () => _displayDialog(),
	      tooltip: 'Add Item',
	      child: Icon(Icons.add)),
	);
}

  //other functions

}