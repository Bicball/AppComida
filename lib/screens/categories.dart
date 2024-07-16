import 'package:comida/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:comida/data/dummy_data.dart';
import 'package:comida/screens/meals.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen ({super.key});

  //in Stateless widgets Context is not globally available
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) => ComidaScreen(
                title: 'Something',
                meals: []),
        ),
    ); //ALT: Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          //availableCategories.map((e) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {_selectCategory(context);},
            )
        ],)
    );
  }
}