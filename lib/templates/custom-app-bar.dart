import 'package:flutter/material.dart';
import 'file:///C:/Users/ASUS/Documents/GitHub/plant-app-flutter-ui/lib/templates/constants.dart';

//Custom Imports

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              color: kPrimaryColor,
                /*borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(70.0)
                ),*/
                image: DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(height: 20.0,),
          Spacer(),
        ],
      ),
    );
  }
}