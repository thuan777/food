import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({this.categoryName,this.imagePath,this.numberOfItems});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
        child:  Row(
          children: <Widget>[
            Image(
              image: AssetImage(imagePath),
              height: 70.0,
              width: 70.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(categoryName,style: TextStyle(fontWeight: FontWeight.bold),),
                Text("$numberOfItems kings")
              ],
            )
          ],
        ),
      )
    );
  }
}
