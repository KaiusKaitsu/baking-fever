import 'package:flutter/material.dart';
import 'package:baking_fever/providers.dart';
import 'package:baking_fever/screens/recipePage.dart';

class RecipeSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = recipeProvider.where((recipe) => recipe['name'].toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final recipe = results[index];
        return ListTile(
          title: Text(recipe['name']),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe)),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = recipeProvider.where((recipe) => recipe['name'].toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final recipe = suggestions[index];
        return ListTile(
          title: Text(recipe['name']),
          onTap: () {
            query = recipe['name'];
            showResults(context);
          },
        );
      },
    );
  }
}
