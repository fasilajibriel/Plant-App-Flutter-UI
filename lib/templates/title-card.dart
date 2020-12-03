import 'package:flutter/material.dart';

import 'constants.dart';

class TitleCard extends StatelessWidget {
  final title;

  const TitleCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: window.width * 0.05),
          width: window.width * 0.6,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}