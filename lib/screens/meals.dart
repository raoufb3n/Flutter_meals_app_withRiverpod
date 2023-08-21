import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/mealScreen.dart';
import 'package:meals_app/widgets/MealCard.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.meal, this.title});
  final List<Meal> meal;
  final String? title;
  static String id = 'MealsScreen';
  
  @override
  Widget build(BuildContext context) {
    Widget Content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: ((context, index) => MealCard(
              meal: meal[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealScreen(
                            meal: meal[index],
                            
                          )),
                );
              },
            )));
    if (meal.isEmpty) {
      Content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ooops..nothing her!!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'try selecting another category!',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return Content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Content,
    );
  }
}
