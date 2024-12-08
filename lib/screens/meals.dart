import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detils.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetilsScreen(meal: meal, onToggleFavorite: onToggleFavorite,)),);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (cnx, index) => MealItem(meal: meals[index], onSelectMeal: (meal){
          selectMeal(context, meal);
        },
        ),
      );
    if(meals.isEmpty){
      content = const Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh... Nothin here', style: TextStyle(color: Colors.black)),
          SizedBox(height: 16,),
          Text('Try Selecting a different categort.', style: TextStyle(color: Colors.black),)
        ],
      ),);
    }

    if(title == null){
      return content;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
  
}