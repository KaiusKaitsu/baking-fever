import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe['name'])),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Placeholder(fallbackHeight: 400),
          SizedBox(height: 16.0),
          Text('Ingredients', style: Theme.of(context).textTheme.headline6),
          Text((recipe['ingredients'] as List<dynamic>).join('\n')),
          SizedBox(height: 16.0),
          Text('Steps', style: Theme.of(context).textTheme.headline6),
          Text((recipe['steps'] as List<dynamic>).join('\n')),
        ],
      ),
    );
  }
}