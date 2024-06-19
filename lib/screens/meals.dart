import 'package:flutter/material.dart';
import 'package:comida/models/meal.dart';

class ComidaScreen extends StatelessWidget {
  const ComidaScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {

    Widget content = Center(child: Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text('Nothing to show!', style: Theme.of(context)
            .textTheme.headlineLarge!.copyWith(color: Theme.of(context)
            .colorScheme.onBackground)),
        const SizedBox(height: 16,),
        Text('Try selecting a different category!', style: Theme.of(context)
            .textTheme.bodyLarge!.copyWith(color: Theme.of(context)
            .colorScheme.onBackground))
      ],
    ));

    if(meals.isNotEmpty){
      //Estamos criando uma ListView para exibir as comidas.
      //Esse construtor só é usado para os itens que estão visíveis.
      content = ListView.builder(
        itemCount: meals.length,
          itemBuilder: (ctx, index) => Text(meals[index].title));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content
    );
  }
}