import 'package:comida/models/meal.dart';
import 'package:comida/widgets/meal_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

//Esse widget exibirá as informações importantes sobre as receitas em uma
//categoria específica.
class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectedMeal,
  });

  final Meal meal;
  //A comida selecionada será tratada através dessa função que é atributo
  //Referência adicional: https://dart.dev/language/functions
  final void Function (Meal meal) onSelectedMeal;

  //Esse método busca a complexidade da receita e retorna com o primeiro
  //caractere em caixa alta
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge, //Força o formato anterior em todos os filhos
      elevation: 2,
      child: InkWell(   //O Inkwell nos fornecerá a propriedade de clicar
        onTap: () {
          onSelectedMeal(meal);
        },
        child: Stack( //Esse  widget permite organizar widgets sobrepondoos
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            icon: Icons.work, label: '$complexityText'),
                        const SizedBox(width: 12),
                        MealItemTrait(
                            icon: Icons.attach_money, label: '$affordabilityText')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
