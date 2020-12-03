import 'package:flutter/material.dart';
import 'package:plant_app/components/account/account-component.dart';
import 'package:plant_app/components/home/home-component.dart';
import 'package:plant_app/components/requests/requests-conponent.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentIndex = 1;

  List pages = List();

  @override
  void initState(){
    super.initState();
    pages..add(Requests())..add(Home())..add(Account());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex:_currentIndex,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.playlist_add_check),title: Text("Requests", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: "Poppins"),)),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),title: Text("Home", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: "Poppins"),)),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account),title: Text("Account", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: "Poppins"),)),
        ],
        onTap: (selectedIndex){
          setState(() {
          _currentIndex = selectedIndex;
        });},
      ),
      body:pages[_currentIndex],
    );
  }
}
