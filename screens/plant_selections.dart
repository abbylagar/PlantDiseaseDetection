import 'package:flutter/material.dart';
import 'package:plant/screens/plant_box.dart';
import 'package:plant/tools/plantClass.dart';
class PlantSelections extends StatefulWidget {
  @override
  _PlantSelectionsState createState() => _PlantSelectionsState();
}

class _PlantSelectionsState extends State<PlantSelections> {
  @override
  Widget build(BuildContext context) {
    final plants = PlantClass.getPlantClass();
    return ListView.builder(itemCount: plants.length,
    itemBuilder:(context,index){
      return PlantBox(item:plants[index]);
    } 
    
    );
  }
}