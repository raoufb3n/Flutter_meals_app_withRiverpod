import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mealItemTrait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals.dart';

class MealCard extends StatelessWidget {
   MealCard({super.key, required this.meal,required this.onTap});
  final Meal meal;
  void Function()? onTap;
  String get() {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get2() {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.secondary,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(get(), style: Theme.of(context).textTheme.bodySmall)),
            SizedBox(
              height: 8,
            ),
            Text(
              meal.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(205, 0, 0, 0)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MealItemTrait(
                    icon: Icons.schedule, label: meal.duration.toString()),
                SizedBox(
                  width: 8,
                ),
                MealItemTrait(icon: Icons.price_check, label: get2())
              ],
            )
          ]),
        ),
      ),
    );
  }
}
