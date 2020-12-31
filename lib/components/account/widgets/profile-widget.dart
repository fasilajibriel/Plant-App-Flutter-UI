import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/templates/orders-card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Text(
            Get.find<SharedPreferences>().getString('userFName') != null
                ? Get.find<SharedPreferences>().getString('userLName') != null
                ? Get.find<SharedPreferences>().getString('userFName') +
                ' ' +
                Get.find<SharedPreferences>().getString('userLName')
                : ''
                : '',
            style: TextStyle(fontSize: 25.0, fontFamily: 'Poppins'),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          Text(
            'Orders',
            style: TextStyle(fontSize: 20),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          FutureBuilder(
            future:
            Get.find<SharedPreferences>().getString('userRole') == 'admin'
                ? HTTPCalls.getAllOrders()
                : HTTPCalls.getUserOrders(
                Get.find<SharedPreferences>().getInt('userId')),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                List data = snapshot.data[0];
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return OrdersCard(
                          name: data[index]['name'],
                          price: double.tryParse(data[index]['price']),
                          isAdmin: Get.find<SharedPreferences>().getString('userRole') == 'admin' ? true : false,
                        );
                      },
                    ),
                );
              } else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ],
      ),
    );
  }
}
