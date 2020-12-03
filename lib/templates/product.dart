import 'package:flutter/material.dart';

import 'constants.dart';

class Product extends StatelessWidget {
  const Product({
    Key key,
    this.image,
    this.name,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, name;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(
            kDefaultPadding / 2
        ),
        width: 200.0,
        height: 300.0,
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 210,
                margin: EdgeInsets.only(top: 50.0,),
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "$name".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                        ),
                        Text(
                          '\$$price',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: kPrimaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 170.0,
                height: 200.0,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}