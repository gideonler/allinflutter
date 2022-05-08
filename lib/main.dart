// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Code written in Dart starts exectuting from the main function. runApp is part of
// Flutter, and requires the component which will be our app's container. In Flutter,
// every component is known as a "widget".
void main() {
  runApp(const MyApp());
}

// Every component in Flutter is a widget, even the whole app itself
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup name generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup name generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override

  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions=<WordPair>[];
  final _biggerFont=const TextStyle(fontSize:18);
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
      return ListTile(
        title: Text(
          _suggestions[index].asPascalCase,
          style: _biggerFont,
        ),
      );
    },
  );
  
 }
}