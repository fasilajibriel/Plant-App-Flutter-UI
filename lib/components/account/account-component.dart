import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/components/account/widgets/profile-widget.dart';
import 'package:plant_app/components/global/login-widget.dart';
import 'package:plant_app/templates/constants.dart';
import 'package:plant_app/templates/custom-app-bar.dart';
import 'package:plant_app/templates/title-card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
                      title: 'Account',
                    ),
                    Expanded(
                        child: Get.find<SharedPreferences>().getBool('isLoggedIn')
                            ? Profile()
                            : LoginSignUp(
                                refreshParent: refreshParent,
                              )),
                  ],
                ),
              ),
              /*floatingActionButton: Get.find<SharedPreferences>()
                      .getBool('isLoggedIn')
                  ? FloatingActionButton.extended(
                      backgroundColor: kPrimaryColor,
                      icon: Icon(Icons.shopping_cart),
                      label: Text("Cart"),
                      onPressed: () {
                        print(Get.find<SharedPreferences>().getInt('userId'));
                        print(Get.find<SharedPreferences>()
                            .getString('userRole'));
                        print(Get.find<SharedPreferences>()
                            .getString('userFName'));
                        print(Get.find<SharedPreferences>()
                            .getString('userLName'));
                      },
                    )
                  : Container(),*/
            ),
          ),
          SafeArea(child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  IconButton(icon: Icon(Icons.logout, color: Colors.white,), onPressed: (){
                    setState(() {
                      Get.find<SharedPreferences>().setBool('isLoggedIn', false);
                    });
                  })
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
