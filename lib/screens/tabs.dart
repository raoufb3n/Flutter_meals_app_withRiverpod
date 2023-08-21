import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favoriteProvider.dart';
import 'package:meals_app/screens/FiltersScreen.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/meals.dart';

import '../providers/FilterProvider.dart';
import '../widgets/mainDrawer.dart';

class tabsScreen extends ConsumerStatefulWidget {
  tabsScreen({super.key});

  @override
  ConsumerState<tabsScreen> createState() => _tabsScreenState();
}

class _tabsScreenState extends ConsumerState<tabsScreen> {
  int SelectedPageindex = 0;

  selectedPage(int index) {
    setState(() {
      SelectedPageindex = index;
    });
  }

  void _setScreen(String id) async {
    Navigator.pop(context);
    if (id == 'Filters') {
      await Navigator.push<Map<Filter, bool>>(context,
          MaterialPageRoute(builder: (context) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final AvailbeleMeals = ref.watch(filtredMealsProvider);

    Widget activePage = categoriesScreen(
      availbleMeals: AvailbeleMeals,
    );
    var activePagetitle = 'Categories';
    if (SelectedPageindex == 1) {
      final _favoritemeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meal: _favoritemeal,
        title: '',
      );
      activePagetitle = 'Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onselectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: SelectedPageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        onTap: selectedPage,
      ),
    );
  }
}
