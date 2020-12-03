import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String content;

  const RequestCard({Key key, this.firstName, this.lastName, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Container(
      height: 100.0,
      width: window.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(firstName + ' ' + lastName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text(content, maxLines: 1,)
            ],
          ),
          IconButton(icon: Icon(Icons.phone), onPressed: (){})
        ],
      ),
    );
  }
}