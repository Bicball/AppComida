import 'package:comida/widgets/category_grid_item.dart';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:comida/data/dummy_data.dart';
import 'package:comida/screens/meals.dart';
import 'package:comida/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //in Stateless widgets Context is not globally available
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
        ),
      ),
    ); //ALT: Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            //availableCategories.map((e) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        );
  }
}
