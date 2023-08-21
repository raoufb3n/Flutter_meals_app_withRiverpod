import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';

class Category_Item extends StatelessWidget {
   Category_Item({super.key, required this.category,required this.onTap});
  final Category category;
   void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
