import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomList({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          SizedBox(
            width: 17.0,
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 17.0),
          )
        ],
      ),
    );
  }
}
