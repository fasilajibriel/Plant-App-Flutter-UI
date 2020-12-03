import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'file:///C:/Users/ASUS/Documents/GitHub/plant-app-flutter-ui/lib/components/global/login-widget.dart';
import 'package:plant_app/components/requests/widgets/my-requests-widget.dart';
import 'file:///C:/Users/ASUS/Documents/GitHub/plant-app-flutter-ui/lib/templates/constants.dart';
import 'package:plant_app/templates/custom-app-bar.dart';
import 'package:plant_app/templates/title-card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  void refreshParent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: window.width,
                child: Column(
                  children: [
                    TitleCard(
                      title: 'Requests',
                    ),
                    Expanded(
                        child: Get.find<SharedPreferences>().getBool('isLoggedIn')
                            ? MyRequests()
                            : LoginSignUp(
                                refreshParent: refreshParent,
                              )),
                  ],
                ),
              ),
              floatingActionButton:
                  Get.find<SharedPreferences>().getBool('isLoggedIn') &&
                          Get.find<SharedPreferences>().getString('userRole') ==
                              'user'
                      ? FloatingActionButton.extended(
                          backgroundColor: kPrimaryColor,
                          icon: Icon(Icons.add),
                          label: Text("Submit Request"),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text('Submit Request'),
                                      content: Container(),
                                    ));
                          },
                        )
                      : Container(),
            ),
          )
        ],
      ),
    );
  }
}
