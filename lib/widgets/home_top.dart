import 'package:flutter/material.dart';

class HomeTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("What would",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.blue),),
            Text("you like to eat?",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.blue))
          ],
        ),
        Icon(Icons.notifications_none,color: Colors.blue,)
      ],
    );
  }
}
