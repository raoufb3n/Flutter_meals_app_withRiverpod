import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);
  bool ToggleFavoriteStatus(Meal meal) {
    final mealisFavorite = state.contains(meal);
    if (mealisFavorite) {
      state = state.where((Meal m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(((ref) {
  return FavoriteMealsNotifier();
}));
