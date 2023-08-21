import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
