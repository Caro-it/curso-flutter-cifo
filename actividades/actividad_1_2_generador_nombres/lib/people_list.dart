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
  final _randomNames = RandomNames(Zone.catalonia); // Nou

  bool _loading = false;

  void _addNames() {
    for (var j = 0; j < 10; j++) {
      _suggestions.add(_randomNames.fullName());
    }
  }

  @override
  void initState() {
    super.initState();
    _addNames(); // los 10 primeros nombres al arrancar
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _suggestions.length,
      separatorBuilder: (context, i) => const Divider(),
      itemBuilder: (context, i) {
        // Al llegar al último nombre, generamos 10 más
        if (i == _suggestions.length - 1 && !_loading) {
          _loading = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            setState(() {
              _addNames();
              _loading = false;
            });
          });
        }
        return ListTile(title: Text(_suggestions[i], style: _biggerFont));
      },
    );
  }
}
