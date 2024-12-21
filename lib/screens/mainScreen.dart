import 'package:flutter/material.dart';
import 'package:baking_fever/screens/recipePage.dart';
import 'package:baking_fever/screens/listPage.dart';
import 'package:baking_fever/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text('Featured Recipe', style: Theme.of(context).textTheme.titleLarge),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipePage(recipe: recipeProvider.first)),
          ),
          child: Column(
            children: [
              const Placeholder(fallbackHeight: 300),
              const SizedBox(height: 8),
              Text(recipeProvider.first['name'], style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Text('Categories', style: Theme.of(context).textTheme.titleLarge),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          itemCount: 2,
          itemBuilder: (context, index) {
            final category = categoryProvider[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeListPage(category: category)),
              ),
              child: Column(
                children: [
                  const Placeholder(fallbackHeight: 200),
                  const SizedBox(height: 8),
                  Text(category['name'], style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}