import 'package:flutter/material.dart';
import 'package:plant/screens/myhomepage.dart';
import 'package:plant/screens/settings.dart';



class Recognize extends StatefulWidget {
  @override
  _RecognizeState createState() => _RecognizeState();
}

class _RecognizeState extends State<Recognize> {
 
  int _selectedIndex = 1;

    static const List<BottomNavigationBarItem> _navigationBarItems =[
      BottomNavigationBarItem(label:"HOME",icon: Icon(Icons.home)),
      BottomNavigationBarItem(label:"RECOGNIZE",icon: Icon(Icons.camera)),
      BottomNavigationBarItem(label:"SETTINGS",icon: Icon(Icons.settings_applications)),
    ];

  Widget _currentWidget = Recognize();

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        switch (index) {
          case 0:
            _currentWidget = MyHomePage();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
            break;
          case 1:
            _currentWidget = Recognize();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Recognize()));
            
            break;
          case 2:
            _currentWidget = Settings();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Settings()));
            
          break;
        
        }
      });
    }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      
      
      body: Text("recognize"),
      bottomNavigationBar: BottomNavigationBar(elevation: 5,
      backgroundColor:Colors.green[50] ,
      items: _navigationBarItems,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    )
    );
  }
}

