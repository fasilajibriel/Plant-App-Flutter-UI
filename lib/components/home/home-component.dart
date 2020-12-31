import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/components/detail/detail-component.dart';
import 'package:plant_app/components/home/widgets/add-product-dialog-widget.dart';
import 'package:plant_app/components/home/widgets/featured-widget.dart';
import 'package:plant_app/models/products.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/templates/add-button.dart';
import 'package:plant_app/templates/constants.dart';
import 'package:plant_app/templates/custom-app-bar.dart';
import 'package:plant_app/templates/product.dart';
import 'package:plant_app/templates/title-card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void refreshHome() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery
        .of(context)
        .size;

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
                      TitleCard(title: 'Shop',),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(left: window.width * 0.05),
                                  child: Text(
                                    "Recommended",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                if (Get.find<SharedPreferences>().getString(
                                    'userRole') != null && Get.find<
                                    SharedPreferences>().getString('userRole') ==
                                    'admin')
                                  Container(
                                    margin:
                                    EdgeInsets.only(right: window.width * 0.05),
                                    child: Material(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(50.0),
                                        child: AddButton(),
                                        onTap: () async {
                                          String returnValue = await showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              title: Text('Add Product'),
                                              content: AddProduct(),
                                            )
                                          );

                                          if(returnValue == 'success') {
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            /*Container(
                              width: window.width,
                              height: 320,
                              child: FutureBuilder(
                                future: HTTPCalls.getAllProducts(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    print(snapshot.data[0]);
                                    List data = snapshot.data[0].map((products) => new Products.fromJson(products)).toList();
                                    return Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.length,
                                          itemBuilder: (context, index) {
                                            return Product(
                                              image: data[index].image,
                                              price: int.tryParse(data[index].price),
                                              name: data[index].name,
                                              press: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Detail(
                                                          image: data[index].image,
                                                          name: data[index].name,
                                                          priceVal: int.tryParse(data[index].price),
                                                        ),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),*/
                            Container(
                              height: 320,
                              child: FutureBuilder(
                                future: HTTPCalls.getAllProducts(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List data = snapshot.data[0].map((products) => new Products.fromJson(products)).toList();
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          return Product(
                                            image: data[index].image,
                                            price: int.tryParse(data[index].price),
                                            name: data[index].name,
                                            press: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Detail(
                                                        image: data[index].image,
                                                        name: data[index].name,
                                                        priceVal: int.tryParse(data[index].price),
                                                        id: data[index].id,
                                                      ),
                                                ),
                                              );
                                            },
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Center(child: CircularProgressIndicator());
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(left: window.width * 0.05),
                                  child: Text(
                                    "Featured",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                                if (Get.find<SharedPreferences>().getString(
                                    'userRole') != null && Get.find<
                                    SharedPreferences>().getString('userRole') ==
                                    'admin')
                                  Container(
                                    margin:
                                    EdgeInsets.only(right: window.width * 0.05),
                                    child: Material(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(50.0),
                                        child: AddButton(),
                                        onTap: () {},
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  Featured(
                                    image: "assets/images/bottom_img_1.png",
                                    press: () {},
                                  ),
                                  Featured(
                                    image: "assets/images/bottom_img_2.png",
                                    press: () {},
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}


