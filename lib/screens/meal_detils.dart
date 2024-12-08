import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetilsScreen extends StatelessWidget{
  const MealDetilsScreen({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          }, 
          icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            const Text('Ingredients', style: TextStyle(color: Color.fromARGB(255, 117, 16, 16), fontWeight: FontWeight.bold, fontSize: 25),),
            const SizedBox(height: 14,),
            for(final ingrediant in meal.ingredients)
              Text(ingrediant, style: const TextStyle(color: Colors.black, fontSize: 20)),
            const SizedBox(height: 24,),
            const Text('Steps', style: TextStyle(color: Color.fromARGB(255, 117, 16, 16), fontWeight: FontWeight.bold, fontSize: 25),),
            const SizedBox(height: 14,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                child: Text(step, style: const TextStyle(color: Colors.black, fontSize: 20,) , textAlign: TextAlign.center,),
              ),
        
          ],
        ),
      ),
    );
  }

}