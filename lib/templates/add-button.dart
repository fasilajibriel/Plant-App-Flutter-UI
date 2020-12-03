import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100.0,
      height: 30.0,
      child: Center(
        child: Text(
          "+ Add",
          style:
          TextStyle(fontSize: 16.0,
              color: Colors.white),
        ),
      ),
    );
  }
}