import 'package:flutter/material.dart';
import 'package:plant/screens/disease_subcollection.dart';
import 'package:plant/tools/plantClass.dart';

class DiseaseBox extends StatelessWidget {
  DiseaseBox({Key key, this.plant}):super(key: key);
  final PlantClass plant;
  @override
  Widget build(BuildContext context) {
//  print(plant.diseases[0].comments);
  double _sizeW=MediaQuery.of(context).size.width;
    double _sizeH=MediaQuery.of(context).size.height;
        return Container(width: _sizeW*0.6,
          height: _sizeH*0.15,
          child: Card(child: Center(
            child: ListTile(
              leading:CircleAvatar(backgroundImage: AssetImage("assets/images/"+plant.image),radius: _sizeH*0.06,),
              title:Text(plant.title,),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>DiseaseSubcollection(plant:plant)));
              },
              ),
          ),
          ),
    );
  }
}