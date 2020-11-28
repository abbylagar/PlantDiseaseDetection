import 'package:flutter/material.dart';
import 'package:plant/screens/disease_selections.dart';
import 'package:plant/screens/myhomepage.dart';

class DiseaseCollection extends StatefulWidget {
  @override
  _DiseaseCollectionState createState() => _DiseaseCollectionState();
}

class _DiseaseCollectionState extends State<DiseaseCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(title:Text("Disease Collection"),
      actions: <Widget>[
           ElevatedButton(child: Icon(Icons.close,color: Colors.white,)
          ,onPressed:(){ 
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
          }
          )
      ],),
      body: Container(padding: EdgeInsets.all(10),
        //height: MediaQuery.of(context).size.height*0.5,
        child:DiseaseSelections() ,) ,     
    );
  }
}