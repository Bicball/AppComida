import 'package:comida/screens/meal_details.dart';
import 'package:flutter/material.dart';
import 'package:comida/models/meal.dart';
import 'package:comida/widgets/meal_item.dart';

class ComidaScreen extends StatelessWidget {
  const ComidaScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  //Função chamada pelo onSelectedMeal de meals.dart para empilhar a nova tela
  void selectMeal (BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal),),);
  }

  @override
  Widget build(BuildContext context) {

    //Esse Widget será exibido caso não existam comidas a serem exibidas em
    //função dos filtros escolhidos
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
          itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectedMeal: (meal){
            selectMeal(context, meal);
          },),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content
    );
  }
}