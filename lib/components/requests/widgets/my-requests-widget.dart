import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/models/requests.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/templates/request-card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: FutureBuilder(
        future: Get.find<SharedPreferences>().getString('userRole').toString() == 'admin' ?
        HTTPCalls.getAllRequests() : HTTPCalls.getUserRequests(Get.find<SharedPreferences>().getInt('userId')),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data[0].map((requests) => new Requests.fromJson(requests)).toList();
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: window.width * 0.05, vertical: 5.0),
                    child: Material(
                      child: InkWell(
                        child: RequestCard(firstName: data[index].firstName, lastName: data[index].lastName, content: data[index].content,),
                        onTap: (){},
                        onLongPress: (){},
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}