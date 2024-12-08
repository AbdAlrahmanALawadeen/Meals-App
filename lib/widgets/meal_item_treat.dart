import 'package:flutter/material.dart';

class MealItemTreat extends StatelessWidget{
  const MealItemTreat({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20,),
        Icon(icon, size: 17, color: Colors.white,),
        const SizedBox(height: 8, ),
        Text(label, style: const TextStyle(color: Colors.white),),
      ],
    );
  }

}