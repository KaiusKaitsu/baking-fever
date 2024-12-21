import 'package:baking_fever/providers.dart';
import 'package:flutter/material.dart';
import 'package:baking_fever/screens/recipePage.dart';

class RandomRecipePage extends StatelessWidget {
  const RandomRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final randomRecipe = (recipeProvider..shuffle()).first;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipePage(recipe: randomRecipe)),
          );
        },
        child: const Text('Show Random Recipe'),
      ),
    );
  }
}