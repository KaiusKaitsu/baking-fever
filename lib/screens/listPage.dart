import 'package:flutter/material.dart';
import 'package:baking_fever/screens/recipePage.dart';
import 'package:baking_fever/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeListPage extends ConsumerWidget {
  final Map<String, dynamic> category;

  const RecipeListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final recipes = recipeProvider.where((recipe) => recipe['category'] == category['id']).toList();
    return Scaffold(
      appBar: AppBar(title: Text('${category['name']} Recipes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe['name']),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe)),
            ),
          );
        },
      ),
    );
  }
}