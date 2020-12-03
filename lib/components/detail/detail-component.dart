import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/detail/widgets/image_and_icons.dart';

import '../../templates/constants.dart';
import 'widgets//title_and_price.dart';

class Detail extends StatelessWidget {

  const Detail({
    Key key,
    @required this.image,
    @required this.name,
    @required this.priceVal,
  }) : super(key: key);

  final String image;
  final String name;
  final int priceVal;

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
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("Add to cart"),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 2,
                        height: 84,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                          ),
                          color: kPrimaryColor,
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
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
