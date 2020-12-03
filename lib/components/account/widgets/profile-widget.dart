import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text(
              Get.find<SharedPreferences>().getString('userFName') != null ?
              Get.find<SharedPreferences>().getString('userLName') != null ?
              Get.find<SharedPreferences>().getString('userFName') + ' ' + Get.find<SharedPreferences>().getString('userLName') : '' : '',
              style: TextStyle(fontSize: 25.0, fontFamily: 'Poppins'),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),
    );
  }
}