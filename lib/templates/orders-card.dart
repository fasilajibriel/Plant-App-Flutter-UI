import 'package:flutter/material.dart';

class OrdersCard extends StatefulWidget {
  final String name;
  final double price;
  final bool isAdmin;
  final bool isOrdered;

  const OrdersCard({Key key, this.name, this.price, this.isAdmin, this.isOrdered}) : super(key: key);

  @override
  _OrdersCardState createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return Container(
      height: 100.0,
      width: window.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Text(widget.price.toString(), maxLines: 1,)
            ],
          ),
          widget.isAdmin ? IconButton(icon: Icon(Icons.access_time), onPressed: (){}) : Icon(Icons.access_time)
        ],
      ),
    );
  }
}