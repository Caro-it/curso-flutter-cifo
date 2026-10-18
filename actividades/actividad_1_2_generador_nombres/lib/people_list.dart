import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';


class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <String>[]; // Nou
  final _biggerFont = const TextStyle(fontSize: 18); // Nou
  final _randomNames = RandomNames(Zone.us); // Nou

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i >= _suggestions.length) {
          //Afegim 10 noms més
          for (var j = 0; j < 10; j++) {
            _suggestions.add(_randomNames.fullName());
          }
        }
        return ListTile(title: Text(_suggestions[i], style: _biggerFont));
      },
    );
  }
}
