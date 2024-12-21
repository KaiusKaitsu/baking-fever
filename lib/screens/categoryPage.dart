import 'package:flutter/material.dart';
import 'package:baking_fever/screens/listPage.dart';
import 'package:baking_fever/providers.dart';

class RecipeCategoryPage extends StatelessWidget {
  const RecipeCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Categories')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemCount: categoryProvider.length,
        itemBuilder: (context, index) {
          final category = categoryProvider[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeListPage(category: category)),
            ),
            child: Column(
              children: [
                const Placeholder(fallbackHeight: 150),
                const SizedBox(height: 8),
                Text(category['name'], style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          );
        },
      ),
    );
  }
}