import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectPage});

  final void Function(String identifier) onSelectPage;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
           padding: EdgeInsets.all(20),
           decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 3, 3), Colors.black
              ],
              begin: Alignment.topLeft,
              end : Alignment.bottomRight,
            ),
           ),
           child: Row(
            children: [
              Icon(Icons.fastfood, color: Colors.white,),
              SizedBox(width: 18,),
              Text('Cooking up!', style: TextStyle(color: Colors.white),),
            ],
           ),
          ),

          ListTile(
            hoverColor: Colors.black,
            leading: const Icon(Icons.restaurant, size: 26, color: Colors.black,),
            title: 
            const Text('Meals',
             style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              ),
            ),
            onTap: (){
              onSelectPage('meals');
            },
          ),

          ListTile(
            hoverColor: Colors.black,
            leading: const Icon(Icons.filter, size: 26, color: Colors.black,),
            title: 
            const Text('Filter',
             style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              ),
            ),
            onTap: (){
              onSelectPage('filters');
            },
          ),
        ],
      ),
    );
  }

}