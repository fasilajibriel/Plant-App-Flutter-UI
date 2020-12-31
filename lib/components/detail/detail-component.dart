import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:plant_app/components/detail/widgets/image_and_icons.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../templates/constants.dart';
import 'widgets//title_and_price.dart';

class Detail extends StatelessWidget {
  const Detail({
    Key key,
    @required this.image,
    @required this.name,
    @required this.priceVal,
    @required this.id,
  }) : super(key: key);

  final String image;
  final String name;
  final int priceVal;
  final int id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          ImageAndIcons(size: size, image: image),
          Column(
            children: [
              Spacer(),
              Column(
                children: [
                  TitleAndPrice(title: name, price: priceVal),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          /*width: size.width / 2,*/
                          height: 84,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              ),
                            ),
                            color: kPrimaryColor,
                            onPressed: () {
                              if(Get.find<SharedPreferences>().getBool('isLoggedIn')) {
                                HTTPCalls.addToCart(
                                    Get.find<SharedPreferences>()
                                        .getInt('userId'),
                                    id)
                                    .then((value) => {
                                  if (value[0] == null)
                                    {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'Order has been sent!'),
                                          actions: [
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    } else {
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text('Oops'),
                                        content: Text(
                                            'Something went wrong!'),
                                        actions: [
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  }
                                });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text('Oops'),
                                    content: Text(
                                        'Login required for orders!'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ), /*Container(),FlatButton(
                          onPressed: () {},
                          child: Text("Add to cart"),
                        ),*/
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
