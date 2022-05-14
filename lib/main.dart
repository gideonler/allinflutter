// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:todo/todo.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
void main() => runApp(MaterialApp(
  title: 'Startup name generator',
  home:MyApp(),
));





// Every component in Flutter is a widget, even the whole app itself
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    
  
 
      return Scaffold(
     
        appBar: AppBar(
          title: const Text('Startup name generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
        drawer: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      title: const Text('Todo page'),
                      leading:Icon(Icons.add_comment),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Todo()),
                        );

                
                      },
                    ),
                  
                  ],
                ),
              ),
            
      
     
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}



//this class stores a list of randomwords for startup names, as well as allows users to save
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{}; //Stores the word pairings that users have favourited
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        final alreadySaved = _saved.contains(_suggestions[index]);//ensure word pairing not already added to favourites
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),//icons added after the text
          trailing: Icon(
            alreadySaved ? Icons.favorite: Icons.favorite_border,
            color: alreadySaved? Colors.red:null,
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
              onTap: (){//here when tile has been tapped, function setState to notify changes
                setState((){
                            if (alreadySaved) {
                      _saved.remove(_suggestions[index]);
                    } else {
                      _saved.add(_suggestions[index]);
                    }
                });
              },//here


        );
      },
    );
  }
}



