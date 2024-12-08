import 'package:flutter/material.dart';


enum Filter{
  glutten,
  lactose,
  vegen,
  vegetarian,
}

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }

}

class _FiltersScreenState extends State<FiltersScreen>{

  var _gluteen = false;
  var _lactose = false;
  var _vegen = false;
  var _vegetarian = false;

  @override
  void initState() {
    _gluteen = widget.currentFilters[Filter.glutten]!;
    _lactose = widget.currentFilters[Filter.lactose]!;
    _vegen = widget.currentFilters[Filter.vegen]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
     /* drawer: MainDrawer(
        onSelectPage: (identifier){
          Navigator.of(context).pop();
          if(identifier == 'meals'){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const TabScreen()));
          }
        }
      ),*/
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutten : _gluteen,
            Filter.lactose : _lactose,
            Filter.vegen : _vegen,
            Filter.vegetarian : _vegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluteen, 
              onChanged: (isChecked){
                setState(() {
                  _gluteen = isChecked;
                });
              },
              title: const Text('gluteen', style: TextStyle(color: Colors.black),),
              subtitle: const Text('Gluteen fdghjhfjghfgfsdfdggnfhmnb'),
              activeColor: Colors.grey,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _lactose, 
              onChanged: (isChecked){
                setState(() {
                  _lactose = isChecked;
                });
              },
              title: const Text('lactose', style: TextStyle(color: Colors.black),),
              subtitle: const Text('Lactose fgfg'),
              activeColor: Colors.grey,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _vegen, 
              onChanged: (isChecked){
                setState(() {
                  _vegen = isChecked;
                });
              },
              title: const Text('Vegen', style: TextStyle(color: Colors.black),),
              subtitle: const Text('Vegen fgfg'),
              activeColor: Colors.grey,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _vegetarian, 
              onChanged: (isChecked){
                setState(() {
                  _vegetarian = isChecked;
                });
              },
              title: const Text('Vegetarian', style: TextStyle(color: Colors.black),),
              subtitle: const Text('Vegetarian fgfg'),
              activeColor: Colors.grey,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }

}