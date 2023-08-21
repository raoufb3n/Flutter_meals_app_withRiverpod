import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/screens/FiltersScreen.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/mealScreen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/MealCard.dart';

import 'data/data.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 131, 57, 0),
      brightness: Brightness.dark),
      textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child:MyApp() ) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: tabsScreen(),
    );
  }
}
