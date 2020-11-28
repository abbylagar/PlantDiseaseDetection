import 'package:flutter/material.dart';
import 'package:plant/screens/disease_box.dart';
import 'package:plant/tools/plantClass.dart';

class DiseaseSelections extends StatefulWidget {
  @override
  _DiseaseSelectionsState createState() => _DiseaseSelectionsState();
}

class _DiseaseSelectionsState extends State<DiseaseSelections> {
  @override
  Widget build(BuildContext context) {
   final items= PlantClass.getPlantClass();
    return ListView.builder(itemCount: items.length,
    itemBuilder: (context,index){
      return(DiseaseBox(plant:items[index]));
    },
      
    );
  }
}


