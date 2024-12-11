import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:comida/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal){
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
    } else{
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});