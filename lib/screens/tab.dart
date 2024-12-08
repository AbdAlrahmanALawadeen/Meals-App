import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {Filter.glutten : false, Filter.lactose : false, Filter.vegen : false, Filter.vegetarian : false};

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});
  

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }

}

class _TabScreenState extends State<TabScreen>{
  int _selectedPageIndex = 0;

  void _selectIndex(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
var activePageTitle = 'Categoties';
    final List<Meal> favoriteMeal = [];
    Map<Filter, bool> _selectedFilters = kInitialFilters;

    void toogleMealFavoriteStatus(Meal meal){
      final isExisting = favoriteMeal.contains(meal);

      if(isExisting){
        setState(() {
          favoriteMeal.remove(meal);
        });
      }
      else{
        setState(() {
          favoriteMeal.add(meal);
        });
      }
    }

    void _setScreen(String identifier) async{
      Navigator.of(context).pop();
      if(identifier == 'filters'){
        final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters)));
        setState(() {
          _selectedFilters = result ?? kInitialFilters;
        });
      }
      
    }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.glutten]! && !meal.isGlutenFree){
        return false;
      }

      if(_selectedFilters[Filter.lactose]! && !meal.isLactoseFree){
        return false;
      }

      if(_selectedFilters[Filter.vegen]! && !meal.isVegan){
        return false;
      }

      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList(); 

    Widget activePage = CategoriesScreen(onToggleFavorite: toogleMealFavoriteStatus, availableMeals: availableMeals,);

    if(_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoriteMeal, 
        
        onToggleFavorite: toogleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),

      drawer: MainDrawer(onSelectPage: _setScreen,),
      body: activePage,

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          _selectIndex(index);
        },
        currentIndex: _selectedPageIndex,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    ); 
  }
  
}