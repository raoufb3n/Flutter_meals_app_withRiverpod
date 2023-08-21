import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../data/data.dart';

class categoriesScreen extends StatefulWidget {
  categoriesScreen({super.key, required this.availbleMeals});
  static String id = 'categoriesScreen';

  final List<Meal> availbleMeals;

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void selectedCategory(Category cAtGory, BuildContext context) {
    final List<Meal> flitredMeals = widget.availbleMeals
        .where((Meal) => Meal.categories.contains(cAtGory.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealsScreen(
        meal: flitredMeals,
        title: cAtGory.title,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: [
          for (final Category in availableCategories)
            Category_Item(
              category: Category,
              onTap: () {
                selectedCategory(Category, context);
              },
            )
        ],
      ),
      builder: (context, child) {
        return SlideTransition( position: Tween(begin:Offset(0.1, 0.3) ,end:Offset(0, 0) ).animate(CurvedAnimation(parent: _animationController, curve:Curves.easeInOut ),) ,child: child, );
          
      
      },
    );
    ;
  }
}
