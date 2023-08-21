import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

import '../models/meals.dart';

enum Filter { glutenfree, lactosefree, vegetrianfree, veganfree }

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.veganfree: false,
          Filter.vegetrianfree: false,
        });
  void SetFilter(Map<Filter, bool> chossenFilter) {
    state = chossenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
        (ref) => FilterProvider());
final filtredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filterData = ref.watch(filtersProvider);
  return meals.where((Meal meal) {
    if (filterData[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    ;
    if (filterData[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    ;
    if (filterData[Filter.veganfree]! && !meal.isVegan) {
      return false;
    }
    ;
    if (filterData[Filter.vegetrianfree]! && !meal.isVegetarian) {
      return false;
    }
    ;
    return true;
  }).toList();
});
