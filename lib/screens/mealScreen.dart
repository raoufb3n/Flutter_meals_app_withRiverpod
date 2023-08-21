import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/providers/FilterProvider.dart';
import 'package:meals_app/providers/favoriteProvider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealScreen extends ConsumerWidget {
  MealScreen({
    super.key,
    required this.meal,
  });

  static String id = 'MealScreen';

  String get() {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get2() {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal = ref.watch(favoriteMealsProvider);
    final bool isfavorite = favoriteMeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdedd = ref
                  .read(favoriteMealsProvider.notifier)
                  .ToggleFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(wasAdedd
                    ? 'Meal adedd to favorite'
                    : 'Meal removed from favorite'),
                duration: Duration(seconds: 1),
              ));
            },
            icon: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                    child: child);
              },
              child: Icon(
                isfavorite ? Icons.star : Icons.star_border,
                key: ValueKey(isfavorite),
              ),
              duration: Duration(milliseconds: 300),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    meal.title,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12),
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Theme.of(context).colorScheme.onBackground),
                        child: Text(
                          get(),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12),
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Theme.of(context).colorScheme.onBackground),
                        child: Text(
                          get2(),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12),
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Theme.of(context).colorScheme.onBackground),
                        child: Text(
                          '${meal.duration}min',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'ingredients',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    meal.ingredients.toString(),
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'steps',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    meal.steps.toString(),
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
